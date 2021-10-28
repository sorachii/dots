#!/bin/zsh

# # STARTUPTIME START
# ZSH_INIT_TIME=$(date +%s%N)

HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
DISABLE_UNTRACKED_FILES_DIRTY="true"


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


# OPTS:
setopt AUTO_CD
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt ALWAYS_TO_END        # Move cursor to the end of a completed word.
setopt PATH_DIRS            # Perform path search even on command names with slashes.
setopt AUTO_MENU            # Show completion menu on a successive tab press.
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH     # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB        # Needed for file modification glob modifiers with compinit.
unsetopt MENU_COMPLETE      # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL       # Disable start/stop characters in shell editor.

# Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# End of Zinit's installer chunk


# PROMPT:
zinit lucid for \
    as"command" from"gh-r" atinit'export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"' atload'eval "$(starship init zsh)"' bpick'*unknown-linux-gnu*' \
    starship/starship

setopt promptsubst

# TMUX-PLUGIN:
zinit lucid for \
    atinit"
        ZSH_TMUX_FIXTERM=true
        ZSH_TMUX_AUTOSTART=true
        ZSH_TMUX_AUTOCONNECT=true
    " \
    OMZP::tmux \
    atinit"HIST_STAMPS=dd.mm.yyyy" \
    OMZL::history.zsh \

# OMZ:
zinit wait lucid for \
  OMZL::compfix.zsh \
  OMZL::completion.zsh \
    atload"
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'
        alias .....='cd ../../../..'
    " \
  OMZL::directories.zsh \
  OMZL::git.zsh \
  OMZL::key-bindings.zsh \
  OMZL::spectrum.zsh \
  OMZL::termsupport.zsh \
  OMZP::git \
  OMZP::fzf \
  djui/alias-tips \
  chriskempson/base16-shell \

# PLUGINS:
    # light-mode atinit"ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20" atload"_zsh_autosuggest_start" \
    #     zsh-users/zsh-autosuggestions \
    #light-mode atinit" \
zinit wait lucid for \
    light-mode atinit"
        typeset -gA FAST_HIGHLIGHT;
        FAST_HIGHLIGHT[git-cmsg-len]=100;
        zpcompinit;
        zpcdreplay;" \
        zdharma/fast-syntax-highlighting \
    light-mode blockf atpull'zinit creinstall -q .' atinit"
        zstyle ':completion:*' completer _expand _complete _ignored _approximate
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        zstyle ':completion:*' menu select=2
        zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
        zstyle ':completion:*:descriptions' format '-- %d --'
        zstyle ':completion:*:processes' command 'ps -au$USER'
        zstyle ':completion:complete:*:options' sort false
        zstyle ':fzf-tab:complete:_zlua:*' query-string input
        zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm,cmd -w -w'
        zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
        zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'" \
        zsh-users/zsh-completions


# PROGRAMS:
zinit wait'1' lucid light-mode for \
    pick"z.sh" \
      knu/z \
    as'command' atinit'export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"' pick"bin/n" \
      tj/n \
		pick"init.sh" \
	    b4b4r07/enhancd \
		as'command' from'gh-r' \
			junegunn/fzf \


# ALIASES:
alias v="$EDITOR"
alias biggest='df -h /;cd /;find . -xdev -type f -size +50M -not -path "./local/*" -print 2>/dev/null | xargs du -sch | sort -h'
alias config='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME'
alias cs='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME status'
alias ca='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME add $@'
alias cc='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME commit'
alias cpush='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME push'
if [[ ! -e ~/.zsh_aliases ]]; then
	touch ~/.zsh_aliases
fi


# Attach shared folder on vmware player
share_pls() {
	sudo vmhgfs-fuse .host:/ /mnt -o subtype=vmhgfs-fuse,allow_other
	ls -latrh /mnt/shared
}


source ~/.profile
source ~/.zsh_aliases
# printf "Time last: $((($(date +%s%N) - ZSH_INIT_TIME) / 1000000)) ms\n"
# unset ZSH_INIT_TIME ZSH_LOADED_TIME ZSH_STARTUP_TIME
