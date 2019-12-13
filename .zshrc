# Lines configured by zsh-newuser-install
# should be in $HOME
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tensaii/.config/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR=nvim
export PAGER=less
export VISUAL=$EDITOR
export TERMINAL=kitty
alias n=nnn
alias take=mkdir project1 && cd "$_"
#kitty -e nnn
