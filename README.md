[![Gittens](http://gittens.r15.railsrumble.com//badge/sorachii/dots)](http://gittens.r15.railsrumble.com/gitten/sorachii/dots)

# about this repo
dots are managed as a git bare repo.

## setup(needs to be updated a bit)
```
echo "$HOME/git/dots" >> ~/.gitignore
git clone https://github.com/sorachii/dots.git ~/git/dots
cd !$
# init.sh installs some useful software. Mostly curl, zsh, fzf are necessary for a pleasant experience.
chmod +x init.sh
./init.sh
git --git-dir=$HOME/git/dots/.git --work-tree=$HOME checkout -f
# useful for tracking config files with bare git repo:
git --git-dir=$HOME/git/dots/.git --work-tree=$HOME config --local status.showUntrackedFiles no
```

---
Good resource on bare git repos: https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained
