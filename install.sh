#! /bin/bash

if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi
echo "OS is $OS"
echo "Version is $VER"

install_package() {
	packages=$@
	case "$OS" in
		Ubuntu)
			echo "apt install $@"
	                sudo apt install $@
			;;
		Darwin)
			echo "brew install $@"
	                brew install $@
			;;
		Arch*)
			echo "pikaur -Sy $@"
	                pikaur -Sy $@
			;;
		*)
			echo "OS not supported"
			;;
	esac
}

install_packages() {
	packages=$(./$1/requirement.sh)

	if [ -f ./$1/preinstall.sh ]; then
		./$1/preinstall.sh
	fi
	
        install_package $packages

	stow -t ${HOME} -d $1 config

	if [ -f ./$1/install.sh ]; then
		./$1/install.sh
	fi
}

install_packages $1

