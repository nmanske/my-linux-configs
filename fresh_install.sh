#!/bin/bash
# Install useful packages on Debian-based systems without thinking too hard

echo -e "Updating...\n"
sudo apt-get update

echo -e "Adding required PPAs...\n"
sudo add-apt-repository ppa:linrunner/tlp

install_packages () {
	for i in $1; do
        msg=' * '
        msg+=$i
        echo $msg
		sudo apt-get install -y $i
	done
	echo ''
}

echo -e "Installing dependencies...\n"
DEPENDENCIES='git gcc make pkg-config libx11-dev libxtst-dev libxi-dev'
install_packages $DEPENDENCIES

echo -e "Installing Essential packages...\n"
ESSENTIAL='chromium-browser terminator vim xcape nodejs audacity'
install_packages $ESSENTIAL

PROGRAMMING='nodejs npm python-pip python3-pip'
install_packages $PROGRAMMING

echo -e "Installing System Info packages...\n"
SYS_INFO='htop screenfetch conky-all'
install_packages $SYS_INFO

echo -e "Installing Display packages...\n"
DISPLAY='redshift redshift-gtk compton'
install_packages $DISPLAY

echo -e "Installing Battery packages...\n"
BATTERY='tlp tlp-rdw'
install_packages $BATTERY

echo -e "Installing STEM packages...\n"
STEM='speedcrunch'
install_packages $STEM

echo -e "Installing Fun packages...\n"
FUN='cowsay fortune cmatrix sl'
install_packages $FUN

echo -e "Don't forget to install...\n"
echo 'Packages: atom libreoffice gimp pia vimrc hack-font'
echo 'Chrome Plugins: uBlock ghostery toggle-tabs surfingkeys toolkit-for-ynab'

echo -e "Upgrading...\n"
sudo apt-get install -y upgrade

echo -e "Upgrading distro...\n"
sudo apt-get install -y dist-upgrade

echo 'Fresh install completed. You may need to restart now.'

