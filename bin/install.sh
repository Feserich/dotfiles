#!/bin/bash
set -e
set -o pipefail

# install.sh
#	This script installs my basic setup for a debian laptop


check_is_sudo() {
	if [ "$EUID" -ne 0 ]; then
		echo "Please run as root."
		exit
	fi
}


base() {

	# TODO adapt the list of apps and make it compatible for Ubuntu and Arch Linux
	apt update || true
	apt -y upgrade

	apt install -y \
		automake \
		bc \
		bzip2 \
		curl \
		file \
		gcc \
		git \
		grep \
		gzip \
		less \
		libc6-dev \
		locales \
		lsof \
		make \
		mount \
		net-tools \
		ssh \
		sudo \
		tar \
		tree \
		unzip \
		vim \
		zip \
		--no-install-recommends

	apt autoremove -y
	apt autoclean -y
	apt clean -y

}


get_dotfiles() {
	# create subshell
	(
	cd "$HOME"

	if [[ ! -d "${HOME}/dotfiles" ]]; then
		# install dotfiles from repo
		git clone git@github.com:Feserich/dotfiles.git"${HOME}/dotfiles"
	fi

	cd "${HOME}/dotfiles"

	# set the correct origin
	git remote set-url origin git@github.com:Feserich/dotfiles.git

	# installs all the things
	make
	)
}

install_zsh()
{
	#TODO install zsh in apt or pamac
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
	git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
}


usage() {
	echo -e "install.sh\\n\\tThis script installs my basic setup for a debian laptop\\n"
	echo "Usage:"
	echo "  base                                - setup sources & install base pkgs"
	echo "  dotfiles                            - get dotfiles"
	echo "  zsh                           		- install zsh and plugins"
}

main() {
	local cmd=$1

	if [[ -z "$cmd" ]]; then
		usage
		exit 1
	fi

	if [[ $cmd == "base" ]]; then
		check_is_sudo

		#base

	elif [[ $cmd == "dotfiles" ]]; then
		get_dotfiles
	elif [[ $cmd == "zsh" ]]; then
		install_zsh
	else
		usage
	fi
}

main "$@"
