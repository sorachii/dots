#!/usr/bin/env bash

printf "\e[1;34mUpdating the system.\e[0m\n"
# Installing mytmux, zsh, nvim
if command -v apt > /dev/null; then
	sudo apt update
	sudo apt upgrade -y
	printf "\e[1;34mInstalling essential tools.\e[0m\n"
    # necessary
	sudo apt install zsh tmux ripgrep curl -y
    # extra
	sudo apt install python3-pip python3-venv ripgrep universal-ctags nodejs -y
	# build requirements for neovim
	sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y
elif command -v yum > /dev/null; then
	sudo yum upgrade
	printf "\e[1;34mInstalling essential tools.\e[0m\n"
	sudo yum install zsh tmux
	# build requirements for neovim
	sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext
elif command -v pacman > /dev/null; then
	sudo pacman -Syu
	printf "\e[1;34mInstalling essential tools.\e[0m\n"
	sudo pacman -S zsh tmux
	# build requirements for neovim
	sudo pacman -S base-devel cmake unzip ninja tree-sitter
elif command -v apk > /dev/null; then
	apk update
	apk upgrade
	printf "\e[1;34mInstalling essential tools.\e[0m\n"
	apk add zsh tmux
	# build requirements for neovim
	apk add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
else
	printf "\e[1;33mYour distro is not between the supported ones.\e[0m\n"
fi

# Checks out all dotfiles:
git --git-dir=$HOME/git/dots/.git --work-tree=$HOME checkout -f

# If tpm can't be found, download it.
[ ! -d ${HOME}/.tmux/plugins/tpm  ] && git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
printf "\e[1;34mIn first tmux session press 'M-s I' to install plugins.\e[0m\n"

if ! command -v cargo > /dev/null; then
	printf "\e[1;34mInstalling rust and cargo.\e[0m\n"
	curl https://sh.rustup.rs -sSf | sh
fi

if ! command -v fd > /dev/null; then
	printf "\e[1;34mInstalling fd-find.\e[0m\n"
	cargo install fd-find
fi

# Install pip2
if command -v python2 > /dev/null; then
	printf "\e[1;34mInstalling pip2.\e[0m\n"
	curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py
	sudo python2 /tmp/get-pip.py
else
	printf "\e[1;33mPython2 not found.\e[0m\n"
fi

# Building neovim from source
if [ -d ~/git/neovim  ]; then
	printf "\e[1;34mNeovim is already installed.\e[0m\n"
else
	printf "\e[1;34mBuilding Neovim from source.\e[0m\n"
	git clone https://github.com/neovim/neovim.git ~/git/neovim
	cd ~/git/neovim
	git checkout stable
	sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install

	# Pyright is needed for nvim-lsp
	if command -v npm > /dev/null; then
		sudo npm install -g pyright
	else
		printf "\e[1;34mNpm is not installed. It is needed for nvim-lsp.\e[0m\n"
	fi
fi

# Installing nvim plugins
printf "\e[1;34mInstalling nvim plugins.\e[0m\n"
nvim --headless +PackerSync +qa

# Install fzf
if [ ! -f ~/.fzf/bin/fzf ]; then
	printf "\e[1;34mInstalling fzf.\e[0m\n"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# Changes current user's shell to zsh
chsh -s $(which zsh) $USER
