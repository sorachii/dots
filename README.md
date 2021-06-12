# about this repo
dots are managed as a git bare repo.

## setup
```
git clone git@github.com:sorachii/dots.git ~/git/dots
cd !$
# TODO:
# script: install zsh, tmux, alacritty
# instructions: build neovim-nightly
# instructions: stow
```
after stow, run:
```
source ~/.zshrc
config config --local status.showUntrackedFiles no 
config checkout
```
Good resource on bare git repos: https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained
