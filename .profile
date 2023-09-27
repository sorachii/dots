# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# LUA_PATH needs in order to nvim's lua exports work
if [ -d "$HOME/.config/nvim" ] ; then
    export LUA_PATH="$HOME/.config/nvim/jdtls_setup.lua;;"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    case ":${PATH}:" in
        *:"$HOME/.cargo/bin":*)
            ;;
        *)
            # Prepending path in case a system-installed rustc needs to be overridden
            export PATH="$HOME/.cargo/bin:$PATH"
            ;;
    esac
fi

if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
    if [ -d "$HOME/go/bin" ]; then
            PATH="$HOME/go/bin:$PATH"
    fi
fi

if [ -e "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || PATH="$PYENV_ROOT/bin:$PATH"
fi

export PATH=~/n/bin:~/.local/maven/bin:/usr/local/bin:$PATH
eval "$(pyenv init -)"
