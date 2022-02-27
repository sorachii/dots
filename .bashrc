# History control
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=2000000
shopt -s histappend

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if command -v nvim > /dev/null; then
  EDITOR="nvim"
elif command -v vim > /dev/null; then
  EDITOR="vim"
else
  EDITOR="vi"
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
alias ipb="ip -brief address"
alias d="docker"
alias j="jobs"
alias follow="tail -f -n +1"

# config aliases
alias config='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME'
alias cs='config status'
alias cshow='config show'
alias cdiff='config diff'
alias ca='config add $@'
alias caa='config add $(config diff --name-only)'
alias cc='config commit'
alias cpush='config push'

# cd aliases
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

export TERM=xterm-256color
export EDITOR
export VISUAL=$EDITOR

# Personal binaries
#export PATH=~/.local/bin:${PATH}:~/bin
source ~/.profile

# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset
salmon='\[\e[38;5;216m\]'       # 256 color Salmon
lgtgrn='\[\e[38;5;192m\]'       # 256 color Light Green


# Sourcing fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# # Red name for root
# if [ "${UID}" -eq "0" ]; then 
#   nameC="${bldred}" 
# fi

function prompt_command() {
        if [ $? = 0 ]; then
                PS1="\n${salmon}\u${salmon}@${salmon}\h${salmon} ${salmon}\w${lgtgrn}\n❯ ${txtrst}"
        else
                PS1="\n${salmon}\u${salmon}@${salmon}\h${salmon} ${salmon}\w${txtred}\n❯ ${txtrst}"
        fi
}

PROMPT_COMMAND=prompt_command
