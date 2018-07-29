#!/usr/bin/env bash
# Install useful packages on Debian-based systems without thinking too hard


PPAS='pinta-maintainers/pinta-stable shutter/ppa linrunner/tlp'

# Install using a Debian-based package manager
DEPENDENCIES='git gcc make pkg-config libx11-dev libxtst-dev libxi-dev'
ESSENTIAL='chromium-browser terminator vim tree xcape pass curl ranger xclip autojump tmux'
PROGRAMMING='nodejs npm python-pip python3-pip clang httpie'
SHELL='zsh fonts-powerline'
SYS_INFO='htop screenfetch conky-all pv ncdu vnstat'
DISPLAY='redshift redshift-gtk compton xscreensaver'
IMAGE='pinta inkspace shutter'
BATTERY='tlp tlp-rdw powertop'
STEM='speedcrunch pi'
FUN='cowsay fortune cmatrix sl hollywood tty-clock toilet oneko nyancat ddate rig xcowsay'

# Install using pip (Python Package Index)
#PIP_PACKAGES=''

# Install using another method (check the website)
OTHER_PACKAGES='Other Packages: amdgpu-pro atom libreoffice gimp pia bash-snippets tldr vtop neofetch lolcat'
ATOM_PACKAGES='Atom Packages: platformio-ide-{debugger,terminal} minimap-{,cursorline,find-and-replace,highlight-selected} open-recent'
VSCODE_PACKAGES='Visual Studio Code Packages: platformio-ide seti-icons settings-sync c-cpp-intellisense output-colorizer native-debug seti-monokai-theme'
FIREFOX_PLUGINS='Firefox Plugins: uBlock decentraleyes privacy-settings self-destructing-cookies noscript canvas-blocker tab-toggle toolkit-for-ynab multiple-tab-handler pocket bitwarden flagfox text-contrast-for-dark-themes ubuntu-modifications'

# Color code script output to easily view progress
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# INSTALL PACKAGES

add_ppas () {
    for i in "$@"; do
        if ! [[ $(which ${i}) ]]; then
            msg="\n${GREEN}* ppa:"
		    msg+=$i
		    msg+="${NC}"
            echo -e $msg
            sudo add-apt-repository -y ppa:${i}
        fi
	done
}

echo -e "\n${RED}Adding required PPAs...\n${NC}"
add_ppas $PPAS

echo -e "\n${RED}Updating...\n${NC}"
sudo apt-get update

install_packages () {
	for i in "$@"; do
        msg="\n${GREEN}* "
		msg+=$i
		msg+="${NC}"
        echo -e $msg
	    sudo apt-get install -y $i
	done
	echo ''
}

echo -e "\n${RED}Installing Dependencies...${NC}"
install_packages $DEPENDENCIES
sudo dpkg-reconfigure libdvd-pkg

echo -e "${RED}Installing Essential packages...${NC}"
install_packages $ESSENTIAL

echo -e "${RED}Installing Programming packages...${NC}"
install_packages $PROGRAMMING

echo -e "${RED}Installing Shell packages...${NC}"
install_packages $SHELL

echo -e "${RED}Installing System Info packages...${NC}"
install_packages $SYS_INFO

echo -e "${RED}Installing Display packages...${NC}"
install_packages $DISPLAY

echo -e "${RED}Installing Image packages...${NC}"
install_packages $IMAGE

echo -e "${RED}Installing Battery packages...${NC}"
install_packages $BATTERY

echo -e "${RED}Installing STEM packages...${NC}"
install_packages $STEM

echo -e "${RED}Installing Fun packages...${NC}"
install_packages $FUN

echo -e "${RED}Installing pip packages...${NC}"
sudo pip install -U platformio

echo -e "${RED}Don't forget to install...\n${NC}"
echo -e "${GREEN}${OTHER_PACKAGES}${NC}"
echo -e "${GREEN}${ATOM_PACKAGES}${NC}"
echo -e "${GREEN}${VSCODE_PACKAGES}${NC}"
echo -e "${GREEN}${FIREFOX_PLUGINS}${NC}"

echo -e "\n${RED}Upgrading...\n${NC}"
sudo apt-get -y upgrade

echo -e "\n${RED}Fresh install completed. You may need to restart now.${NC}"

# INSTALL OH MY ZSH PLUGINS/THEMES

# Directories
OH_MY_ZSH_PLUGINS_DIR='~/.oh-my-zsh/custom/plugins'

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $OH_MY_ZSH_PLUGINS_DIR
git clone https://github.com/zsh-users/zsh-syntax-highlighting $OH_MY_ZSH_PLUGINS_DIR

# Install Theme
npm install --global pure-prompt
