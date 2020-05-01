# .zshenv
# Aaron Lichtman

export OS="$(uname -s)"

#########
# Editors
#########

export EDITOR='nvim'
export VISUAL='nvim'

#####
# XDG
#####

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

############################
# House Cleaning (~ cleanup)
############################

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export GRIPHOME=$XDG_CONFIG_HOME/grip
export WAKATIME_HOME=$XDG_CONFIG_HOME/wakatime
export MPLCONFIGDIR=$XDG_CONFIG_HOME/matplotlib
export _Z_DATA=$XDG_CACHE_HOME/.z
export PYENV_ROOT=/usr/local/var/pyenv
export LESSHISTFILE=$XDG_CACHE_HOME/lesshst
export NODE_REPL_HISTORY=$XDG_CACHE_HOME/node_repl_history
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc

##############
# Random Paths
##############

export GOPATH=$HOME/go
export ZSH=$HOME/.oh-my-zsh

##############
# gcc / OS-Dev
##############

if [ "$OS" = "Darwin" ]; then
    export CC=/usr/local/bin/gcc-9
    export LD=/usr/local/bin/gcc-9
elif [ "$OS" = "Linux" ]; then
    export CC=/usr/bin/gcc-9
    export LD=/usr/bin/gcc-9
fi


export OS_DEV_PREFIX="/Users/alichtman/bin/i386elfgcc"
export TARGET=i386-elf
export PATH="$OS_DEV_PREFIX/bin:$PATH"

#############
# PATH Config
#############

export PATH="$PATH:$HOME/.poetry/bin"
export PATH="$PATH:/usr/local/opt/openssl/bin"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/local"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/Cellar/john-jumbo/1.8.0/share/john"
export PATH="$PATH:$HOME/.local/share/radare2/prefix/bin"
export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library"
export PATH="$PATH:/usr/local/Cellar/node/13.11.0/bin"
export PATH="$PATH:$HOME/Library/Python/3.7/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"

# Deduplicate entries in PATH
typeset -U PATH
export PATH

# GNU-getopt

if [ $OS = "Darwin" ]; then
    export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
fi

# vim: ts=4 sw=4 tw=0 et ft=zsh :
