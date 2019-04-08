#! /bin/bash

install_package() {
	pikaur -Sy $1
}

install_uninstall_package() {
	package=$1
	if pacman -Qs $package > /dev/null ; then
		echo "$package is already install"
	else
		echo "installing $package"
		install_package $package
	fi
}

install_packages() {
	packages=$(./$1/requirement.sh)
	#for package in $packages
	#do
	#	install_uninstall_package $package
	#done
	
        pikaur -Sy $packages

	stow -t ${HOME} -d $1 config

	if [ -f ./$1/install.sh ]; then
		./$1/install.sh
	fi
}

install_packages $1

