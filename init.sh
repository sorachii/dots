#!/usr/bin/env bash

# tmux, zsh, nvim
if command -v apt > /dev/null; then
	apt full-upgrade
	apt install zsh tmux sudo -y
	# build requirements for neovim
	apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y
elif command -v yum > /dev/null; then
	yum upgrade
	yum install zsh tmux
	# build requirements for neovim
	yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext
elif command -v pacman > /dev/null; then
	pacman -Syu
	pacman -S zsh tmux
	# build requirements for neovim
	pacman -S base-devel cmake unzip ninja tree-sitter
elif command -v apk > /dev/null; then
	# build requirements for neovim
	apk update
	apk upgrade
	apk add zsh
	apk add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
else
	echo "Your distro is not between the supported ones."
fi

chsh -s $(which zsh) $USER

# building neovim from source
git clone git@github.com:neovim/neovim.git ~/git/neovim
cd ~/git/neovim
make
sudo make install
