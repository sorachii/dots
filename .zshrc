HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

export EDITOR=$(which nvim)
export VISUAL=$(which nvim)

DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Turn on some useful options
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

# fzf
if [ ! -f ~/.fzf/bin/fzf ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

if ! command -v starship; then
	sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zplug init
if [ -e $HOME/.zplug/init.zsh ];then
	source ~/.zplug/init.zsh
	zplug 'zplug/zplug', hook-build:'zplug --self-manage'
	zplug "plugins/git", from:oh-my-zsh
	zplug "zsh-users/zsh-history-substring-search"
	zplug "chrissicool/zsh-256color"
	zplug "zsh-users/zsh-completions"
	zplug "b4b4r07/enhancd"

	zplug "sharkdp/fd", \
		from:gh-r, \
		as:command, \
		rename-to:fd

	zplug "stedolan/jq", \
		from:gh-r, \
		as:command, \
		rename-to:jq

	if ! zplug check; then
		zplug install
	fi

	zplug load --verbose
	eval "$(starship init zsh)"
else
	git clone https://github.com/zplug/zplug ~/.zplug
fi

# zsh completion strategies
# zstyle ':completion:*' completer _expand _complete _ignored
# zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
# zstyle :compinstall filename '/home/megaman/.zshrc'
# Defaults.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/prezto/zcompcache"

# Case-insensitive (all), partial-word, and then substring completion.
if zstyle -t ':prezto:module:completion:*' case-sensitive; then
	zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
	setopt CASE_GLOB
else
	zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
	unsetopt CASE_GLOB
fi

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environment Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion. But allow ignoring custom entries from static
# */etc/hosts* which might be uninteresting.
zstyle -a ':prezto:module:completion:*:hosts' etc-host-ignores '_etc_host_ignores'

zstyle -e ':completion:*:hosts' hosts 'reply=(
${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts(|2)(N) 2> /dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2> /dev/null))"}%%(\#${_etc_host_ignores:+|${(j:|:)~_etc_host_ignores}})*}
	${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2> /dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
	)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
	adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
	dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
	hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
	mailman mailnull mldonkey mysql nagios \
	named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
	operator pcap postfix postgres privoxy pulse pvm quagga radvd \
	rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# SSH/SCP/RSYNC
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

autoload -Uz compinit
compinit

# useful when working with git bare repo:
# config config --local status.showUntrackedFiles no
# after git bare setup, run `config checkout`

# aliases:
alias biggest='df -h /;cd /;find . -xdev -type f -size +50M -not -path "./local/*" -print 2>/dev/null | xargs du -sch | sort -h'
alias config='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME'
alias cs='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME status'
alias ca='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME add $@'
alias cc='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME commit'
alias cpush='/usr/bin/git --git-dir=$HOME/git/dots/.git --work-tree=$HOME push'
if [[ ! -e ~/.zsh_aliases ]]; then
	touch ~/.zsh_aliases
fi

source ~/.profile
source ~/.zsh_aliases

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
