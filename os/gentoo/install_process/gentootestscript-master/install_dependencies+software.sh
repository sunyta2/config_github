#!/bin/bash

check_file_exists () {
	file=$1
	if [ -e $file ]; then
		exists=true
	else
		printf "%s doesn't exist\n" $file
		exists=false
		$2
	fi
}
check_dir_exists () {
	file=$1
	if [ -d $file ]; then
		exists=true
	else
		printf "%s doesn't exist\n" $file
		exists=false
		$2
	fi
}

if [ "$EUID" -ne 0 ]
  then printf "The script has to be run as root.\n"
  exit
fi

printf "This script is designed for gentoo linux and it will not work in any other OS\n"
printf "Installing dependencies listed in dependencies.txt...\n"

DEPLIST="`sed -e 's/#.*$//' -e '/^$/d' dependencies.txt | tr '\n' ' '`"
SOFTWARE="`sed -e 's/#.*$//' -e '/^$/d' software.txt | tr '\n' ' '`"

emerge --autounmask-write $DEPLIST
USE="X" emerge app-editors/vim
USE="perl xft" emerge x11-terms/rxvt-unicode
USE="cli libmpv" emerge media-video/mpv
printf "installed dependencies\n"
sleep 5
#defines the directory this script runs in so we can easily return to it
script_home=$(pwd)
check_dir_exists /apps
if $exists; then
	printf "apps directory already exists"
else
	unzip rice.zip
fi
cd apps/
chmod +x rice-gentoo.sh
sh rice-gentoo.sh
printf "Installing software listed in software.txt...\n"
emerge --autounmask-write $SOFTWARE

#installs software from pentoo overlay
cd $script_home
check_dir_exists /usr/local/portage/net-analyzer/responder
if $exists; then
	printf "/usr/local/portage/net-analyzer/responder already exists\n"
else
	mkdir -p /usr/local/portage/net-analyzer/responder
fi
check_dir_exists /usr/local/portage/dev-db/sqlmap
if $exists; then
	printf "/usr/local/portage/cross-x86_64-w64-mingw32 exists\n"
else
	mkdir -p /usr/local/portage/dev-db/sqlmap
fi
check_dir_exists /usr/local/portage/dev-python/impacket
if $exists; then
	printf "/usr/local/portage/dev-python/impacket already exists\n"
else
	mkdir -p /usr/local/portage/dev-python/impacket
fi
check_dir_exists /usr/local/portage/dev-python/ldapdomaindump
if $exists; then
	printf "/usr/local/portage/dev-python/ldapdomaindump exists\n"
else
	mkdir -p /usr/local/portage/dev-python/ldapdomaindump
fi
check_dir_exists /usr/local/portage/dev-python/pycryptodomex
if $exists; then
	printf "/usr/local/portage/dev-python/pycryptodomex already exists\n"
else
	mkdir -p /usr/local/portage/dev-python/pycryptodomex
fi
check_dir_exists /usr/local/portage/net-analyzer/smbmap
if $exists; then
	printf "/usr/local/portage/net-analyzer/smbmap\n"
else
	mkdir -p /usr/local/portage/net-analyzer/smbmap
fi
#mkdir -p /usr/local/portage/cross-x86_64-w64-mingw32
#mkdir -p /usr/local/portage/dev-python/impacket
#mkdir -p /usr/local/portage/dev-python/ldapdomaindump
#mkdir -p /usr/local/portage/dev-python/pycryptodomex
#mkdir -p /usr/local/portage/net-analyzer/smbmap

mv ebuilds/responder-2.3.4.0-r1.ebuild /usr/local/portage/net-analyzer/responder/
mv ebuilds/ldapdomaindump-0.9.1.ebuild /usr/local/portage/dev-python/ldapdomaindump
mv ebuilds/impacket-0.9.20.ebuild /usr/local/portage/dev-python/impacket
mv ebuilds/pycryptodomex-3.9.4.ebuild /usr/local/portage/dev-python/pycryptodomex
mv ebuilds/smbmap-1.1.0-r1.ebuild /usr/local/portage/net-analyzer/smbmap

cd /usr/local/portage/net-analyzer/responder
ebuild responder-2.3.4.0-r1.ebuild manifest
emerge --autounmask-write net-analyzer/responder
cd /usr/local/portage/dev-python/ldapdomaindump
ebuild ldapdomaindump-0.9.1.ebuild manifest
emerge --autounmask-write dev-python/ldapdomaindump
cd /usr/local/portage/dev-python/pycryptodomex
ebuild pycryptodomex-3.9.4.ebuild manifest
emerge --autounmask-write dev-python/pycryptodomex
cd /usr/local/portage/dev-python/impacket
ebuild impacket-0.9.20.ebuild manifest
emerge --autounmask-write dev-python/impacket
cd /usr/local/portage/net-analyzer/smbmap
ebuild smbmap-1.1.0-r1.ebuild manifest
emerge --autounmask-write net-analyzer/smbmap
cd $script_home
cd ..
check_dir_exists Tools
if $exists; then
	printf "Tools directory already exists\n"
else
	mkdir Tools
fi
cd Tools
git clone https://github.com/magnumripper/JohnTheRipper.git
cd src
./configure && make -s clean && make -sj3
cd ..
mv run/ ../john
cd ..
rm -rf JohnTheRipper
git clone https://github.com/sqlmapproject/sqlmap.git
#TODO figure out what's necessary to get this to work
#emerge sys-devel/crossdev
#crossdev --target x86_64-w64-mingw32

printf "software installed\n"
chmod + x install_wordlist.sh
sh install_wordlist.sh
printf "enumeration word list installed in /usr/share/wordlist\n"
