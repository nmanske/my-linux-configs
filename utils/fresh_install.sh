#!/usr/bin/env bash
# Install useful packages on Debian-based systems without thinking too hard
# Pass "laptop" as first arg to install power related packages

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# INSTALL PACKAGES

PPAS='pinta-maintainers/pinta-stable shutter/ppa linrunner/tlp alexlarsson/flatpak'

DEPENDENCIES='git gcc make pkg-config libx11-dev libxtst-dev libxi-dev'
ESSENTIAL='chromium-browser terminator vim tree xcape pass curl ranger xclip autojump tmux flatpak caffeine'
PROGRAMMING='nodejs npm python-pip python-dev python3-pip clang httpie neovim'
SHELL='zsh fonts-powerline'
SYS_INFO='htop screenfetch conky-all pv ncdu vnstat'
DISPLAY='redshift redshift-gtk compton xscreensaver'
WM='i3 i3-wm dunst i3lock i3status suckless-tools compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior'	
IMAGE='pinta inkspace shutter'
STEM='speedcrunch pi'
FUN='cowsay fortune cmatrix sl hollywood tty-clock toilet oneko nyancat ddate rig xcowsay'
LAPTOP='tlp tlp-rdw powertop geany geany-plugins'

# Install using pip (Python Package Index)
PIP_PACKAGES='platformio glances'

# Install using another method (check the website)

ATOM_PACKAGES='Atom Packages: platformio-ide-{debugger,terminal} minimap-{,cursorline,find-and-replace,highlight-selected} open-recent'
VSCODE_PACKAGES='Visual Studio Code Packages: platformio-ide seti-icons settings-sync c-cpp-intellisense output-colorizer native-debug seti-monokai-theme dash dotENV excel-viewer html-snippets partial-diff rainbow-csv spell-right github-pull-requests vs-live-share quokka.js version-lens multi-command bracket-pair-colorizer color-info emojisense gitlens markdown-all-in-one editorconfig bookmarks path-intellisense cdnjs polacode prettier rest-client code-runner vscode-spotify indent-rainbow better-comments vscode-icons project-manager js-es6-code-snippets import-cost auto-rename-tag auto-close-tag git-history indenticator multiple-clipboards eslint'

CHROME_EXTENSIONS='Chrome Extensions: uBlock https-everywhere decentraleyes privacy-badger neat-url toolkit-for-ynab make-medium-readable-again'
FIREFOX_ADDONS='Firefox Add-ons: uBlock decentraleyes privacy-settings self-destructing-cookies cookie-autodelete noscript canvas-blocker tab-toggle toolkit-for-ynab multiple-tab-handler pocket bitwarden flagfox text-contrast-for-dark-themes ubuntu-modifications google-search-link-fix privacy-badger https-everywhere zoom-page-we scroll-anywhere make-medium-readable-again'

CHROME_DEVELOPER_EXTENSIONS='Chrome Developer Extensions: fontface-ninja dimensions color-palette web-developer colorpick-eyedropper ripple-emulator wappalyzer check-my-links web-timer click-and-clean lorem-ipsum-generator neat-url'
FIREFOX_DEVELOPER_ADDONS='Firefox Developer Add-ons: web-developer user-agent-switcher usersnap colorzilla nuke-anything-enhanced cookie-manager bloody-vikings'

OTHER_PACKAGES='Other Packages: amdgpu-pro atom libreoffice gimp pia boostnote mailspring xnconvert peek-screen-recorder trimage ff-multi-converter pick-colour-picker bash-snippets tldr vtop neofetch lolcat krita prettyping fzf diff-so-fancy fd ncdu ack ag jq entr fonts-firacode bat exa imagemagick'

SCREEN_THESE='Check these out: copyq zplug tilix zsh-completions yadm fasd lf pandoc pwgen trash-cli lnav opn-cli asciinema fkill doctoc speedtest-cli get-port-cli public-ip-cli internal-ip-cli pet-snippet-manager caniuse-cmd how2-stackoverflow hub conventional-changelog release-it jq tig pageres-cli yeoman license gi/gitignore.io mycli json-server localtunnel devdocs-desktop artillery automate-with-ansible corebird ramme caprine'

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

echo -e "${RED}Installing Window Management packages...${NC}"
install_packages $WM

echo -e "${RED}Installing Display packages...${NC}"
install_packages $DISPLAY

echo -e "${RED}Installing Image packages...${NC}"
install_packages $IMAGE

echo -e "${RED}Installing STEM packages...${NC}"
install_packages $STEM

echo -e "${RED}Installing Fun packages...${NC}"
install_packages $FUN

if [[ $1 == "laptop" ]]; then
    echo -e "${RED}Installing Laptop packages...${NC}"
    install_packages $LAPTOP
fi

echo -e "${RED}Installing pip packages...${NC}"
sudo pip install -U $PIP_PACKAGES

echo -e "${RED}Don't forget to install...\n${NC}"
echo -e "${GREEN}${OTHER_PACKAGES}${NC}"
echo -e "${GREEN}${ATOM_PACKAGES}${NC}"
echo -e "${GREEN}${VSCODE_PACKAGES}${NC}"
echo -e "${GREEN}${CHROME_EXTENSIONS}${NC}"
echo -e "${GREEN}${FIREFOX_ADDONS}${NC}"
echo -e "${GREEN}${CHROME_DEVELOPER_EXTENSIONS}${NC}"
echo -e "${GREEN}${FIREFOX_DEVELOPER_ADDONS}${NC}"

echo -e "\n${RED}Upgrading...\n${NC}"
sudo apt-get -y upgrade

echo -e "\n${RED}Fresh install completed. You may need to restart now.${NC}"

# INSTALL COMPILERS

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# TODO: Install Golang?

# INSTALL BASH/ZSH RESOURCES

# Directories
OH_MY_ZSH_PLUGINS_DIR='~/.oh-my-zsh/custom/plugins'
OH_MY_ZSH_THEMES_DIR='~/.oh-my-zsh/custom/themes'

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $OH_MY_ZSH_PLUGINS_DIR
git clone https://github.com/zsh-users/zsh-syntax-highlighting $OH_MY_ZSH_PLUGINS_DIR

# Install Themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Backup old RC files
sudo cp ~/.bashrc ~/.bashrc_fresh-install-backup
sudo cp ~/.zshrc ~/.zshrc_fresh-install-backup

# Copy new RC files
sudo cp ../.bashrc ~/.bashrc
sudo cp ../.zshrc ~/.zshrc

# Refresh Changes
source ~/.bashrc
source ~/.zshrc
