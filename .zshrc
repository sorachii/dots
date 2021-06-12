HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

# Turn on some useful options
setopt auto_cd
setopt extended_glob

# Activate context-sensitive completion
autoload -Uz compinit
compinit

if [ ! -f ~/.fzf/bin/fzf ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

if [ -e $HOME/.zplug/init.zsh ];then
	source ~/.zplug/init.zsh
	zplug 'zplug/zplug', hook-build:'zplug --self-manage'
	zplug "plugins/git", from:oh-my-zsh
	zplug "zsh-users/zsh-history-substring-search"
	zplug "zsh-users/zsh-completions"
	zplug "b4b4r07/enhancd"

	zplug "stedolan/jq", \
		from:gh-r, \
		as:command, \
		rename-to:jq

	if ! zplug check; then
		zplug install
	fi

	zplug load --verbose
	eval "$(starship init zsh)"
fi

DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
