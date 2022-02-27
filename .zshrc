#!/bin/zsh

# # STARTUPTIME START
# ZSH_INIT_TIME=$(date +%s%N)

HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

source ~/.profile
# EDITOR:
if command -v nvim > /dev/null; then
  EDITOR="nvim"
elif command -v vim > /dev/null; then
  EDITOR="vim"
else
  EDITOR="vi"
fi
export EDITOR
export VISUAL=${EDITOR}
#export TERM="screen-256color"


# OPTS:
setopt EMACS
setopt AUTO_CD
setopt COMPLETE_IN_WORD         # Complete from both ends of a word.
setopt ALWAYS_TO_END            # Move cursor to the end of a completed word.
setopt PATH_DIRS                # Perform path search even on command names with slashes.
setopt AUTO_MENU                # Show completion menu on a successive tab press.
setopt AUTO_LIST                # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH         # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB            # Needed for file modification glob modifiers with compinit.
setopt BANG_HIST                # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY       # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY            # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS         # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS        # Do not display a line previously found.
setopt HIST_IGNORE_SPACE        # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY              # Don't execute immediately upon history expansion.
setopt PROMPTSUBST              # Parameter expansion, command substitution and arithmetic expansion are performed in prompts. Substitutions within prompts do not affect the command status.
unsetopt MENU_COMPLETE          # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL           # Disable start/stop characters in shell editor.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# if command -v starship > /dev/null; then 
#         eval "$(starship init zsh)"
# fi

# zplug init
if [ -e $HOME/.zplug/init.zsh ];then
	source ~/.zplug/init.zsh
	zplug 'zplug/zplug', hook-build:'zplug --self-manage'
	zplug "plugins/git", from:oh-my-zsh
	#zplug "plugins/tmux", from:oh-my-zsh
	zplug "zsh-users/zsh-completions"
	zplug "b4b4r07/enhancd"
	zplug 'mafredri/zsh-async', from:'github'
	zplug 'sindresorhus/pure', use:'pure.zsh', from:'github', as:'theme'

	if ! zplug check; then
		zplug install
	fi

	zplug load --verbose
#else
#	git clone https://github.com/zplug/zplug ~/.zplug
fi

# ALIASES:
if [[ ! -e ~/.shell_aliases ]]; then
	touch ~/.shell_aliases
fi
source ~/.shell_aliases

alias v="$EDITOR"
alias l="ls -latrh"
alias ll="ls -lh"
alias biggest='df -h /;cd /;find . -xdev -type f -size +50M -not -path "./local/*" -print 2>/dev/null | xargs du -sch | sort -h'
alias config='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME'
alias cs='config status'
alias cshow='config show'
alias cdiff='config diff'
alias ca='config add $@'
alias caa='config add $(config diff --name-only)'
alias cc='config commit'
alias cpush='config push'

j() { javac $1.java && java $1 ; }

# Loading completions
if [[ -e ~/.zsh_completions ]]; then
    source ~/.zsh_completions
fi
#autoload -Uz compinit; compinit

# Make <c-x e> open the current line in your $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

[[ -f ~/z.sh ]] && . ~/z.sh

# useful when working with git bare repo:
# config config --local status.showUntrackedFiles no
# after git bare setup, run `config checkout`

# printf "Time last: $((($(date +%s%N) - ZSH_INIT_TIME) / 1000000)) ms\n"
# unset ZSH_INIT_TIME ZSH_LOADED_TIME ZSH_STARTUP_TIME
