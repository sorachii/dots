# about this repo
dots are managed as a git bare repo.

## setup
```
git clone https://github.com/sorachii/dots.git ~/git/dots
cd !$
chmod +x init.sh
./init.sh
cp ~/git/dots/.zshrc ~
zsh
# TODO:
# instructions: stow
```

## to continue tracking files with bare git repo
```
config config --local status.showUntrackedFiles no 
config checkout
```

---
Good resource on bare git repos: https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained
