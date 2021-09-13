#!/usr/bin/env bash

echo "Update system, then installing zsh, tmux and build tools for neovim."
# Installing mytmux, zsh, nvim
if command -v apt > /dev/null; then
	sudo apt update
	sudo apt upgrade -y
	sudo apt install zsh tmux python3-pip python3-venv ripgrep curl universal-ctags nodejs npm -y
	# build requirements for neovim
	sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y
elif command -v yum > /dev/null; then
	sudo yum upgrade
	sudo yum install zsh tmux
	# build requirements for neovim
	sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext
elif command -v pacman > /dev/null; then
	sudo pacman -Syu
	sudo pacman -S zsh tmux
	# build requirements for neovim
	sudo pacman -S base-devel cmake unzip ninja tree-sitter
elif command -v apk > /dev/null; then
	apk update
	apk upgrade
	apk add zsh tmux
	# build requirements for neovim
	apk add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
else
	echo "Your distro is not between the supported ones."
fi

# If tpm can't be found, download it.
[ ! -d ${HOME}/.tmux/plugins/tpm  ] && git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
# In first tmux session press `M-s I` to install plugins.

# Install pip2
if command -v python2 > /dev/null; then
	curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py
	sudo python2 /tmp/get-pip.py
fi

# Building neovim from source
if [ -d ~/git/neovim  ]; then
	echo "Neovim is already installed"
else
	git clone https://github.com/neovim/neovim.git ~/git/neovim
	cd ~/git/neovim
	git checkout origin/release-0.5
	make
	sudo make install

	# Pyright is needed for nvim-lsp
	if command -v npm > /dev/null; then
		sudo npm install -g pyright
	else
		echo "Npm is not installed. It is needed for nvim-lsp."
	fi
fi
echo "You need to `:PackerSync` and `:COQdeps` once you open nvim"

# Copying zsh config then using it is necessary for
# finishing the configuration and for bare git repo to work
cp ~/git/dots/.zshrc ~
chsh -s $(which zsh) $USER
