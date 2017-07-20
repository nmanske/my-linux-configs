#!/bin/bash
# Install useful packages on Debian-based systems without thinking too hard

setopt shwordsplit

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "\n${RED}Updating...\n${NC}"
sudo apt-get update

echo -e "\n${RED}Adding required PPAs...\n${NC}"
sudo add-apt-repository ppa:linrunner/tlp

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
DEPENDENCIES='git gcc make pkg-config libx11-dev libxtst-dev libxi-dev'
install_packages $DEPENDENCIES

echo -e "${RED}Installing Essential packages...${NC}"
ESSENTIAL='chromium-browser terminator vim tree xcape'
install_packages $ESSENTIAL

echo -e "${RED}Installing Programming packages...${NC}"
PROGRAMMING='nodejs npm python-pip python3-pip'
install_packages $PROGRAMMING

echo -e "${RED}Installing System Info packages...${NC}"
SYS_INFO='htop screenfetch conky-all'
install_packages $SYS_INFO

echo -e "${RED}Installing Display packages...${NC}"
DISPLAY='redshift redshift-gtk compton'
install_packages $DISPLAY

echo -e "${RED}Installing Battery packages...${NC}"
BATTERY='tlp tlp-rdw powertop'
install_packages $BATTERY

echo -e "${RED}Installing STEM packages...${NC}"
STEM='speedcrunch'
install_packages $STEM

echo -e "${RED}Installing Fun packages...${NC}"
FUN='cowsay fortune cmatrix sl'
install_packages $FUN

echo -e "${RED}Don't forget to install...\n${NC}"
echo -e "${GREEN}Packages: atom libreoffice gimp pia bash-snippets${NC}"
echo -e "${GREEN}Chrome Plugins: uBlock ghostery toggle-tabs surfingkeys toolkit-for-ynab${NC}"

echo -e "\n${RED}Upgrading...\n${NC}"
sudo apt-get -y upgrade

echo -e "\n${RED}Upgrading distro...\n${NC}"
sudo apt-get -y dist-upgrade

echo -e "\n${RED}Fresh install completed. You may need to restart now.${NC}"

