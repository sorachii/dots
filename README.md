[![Gittens](http://gittens.r15.railsrumble.com//badge/sorachii/dots)](http://gittens.r15.railsrumble.com/gitten/sorachii/dots)

# about this repo
dots are managed as a git bare repo.

## setup
```
echo "$HOME/git/dots" >> ~/.gitignore
git clone https://github.com/sorachii/dots.git ~/git/dots
cd !$
chmod +x init.sh
./init.sh
zsh
# IN ZSH:
# this places the config files to their respective location
config checkout -f
# useful for tracking config files with bare git repo:
config config --local status.showUntrackedFiles no
```

---
Good resource on bare git repos: https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained
