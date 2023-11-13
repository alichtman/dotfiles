# .zshenv
# Aaron Lichtman

# TODO {{{
#
# 1. Move .ctags to CONFIG: https://github.com/universal-ctags/ctags/pull/2386
# 2. Figure out WAKATIME bug where home dir files are still created after launching sublime
#
# }}}

export OS="$(uname -s)"

#########
# Editors
#########

export EDITOR='nvim'
export PAGER='bat'
export MANPAGER="sh -c 'col -b | bat -l man -p'"
export VISUAL='nvim'

########
# Debian
########

export DEBEMAIL="aaronlichtman@gmail.com"
export DEBFULLNAME="Aaron Lichtman"

#####
# XDG
#####

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_STATE_HOME="$HOME/.local/state"

############################
# House Cleaning (~ cleanup)
############################

export WEGORC="$XDG_CONFIG_HOME"/wegorc
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc
export ELECTRUMDIR="$XDG_DATA_HOME"/electrum
export GRIPHOME="$XDG_CONFIG_HOME"/grip
export LESSHISTFILE="$XDG_CACHE_HOME"/lesshst
export GDBHISTFILE="$XDG_DATA_HOME"/gdb/history
export MPLCONFIGDIR="$XDG_CONFIG_HOME"/matplotlib
export WAKATIME_HOME="$XDG_CONFIG_HOME"/wakatime
export WINEPREFIX="$XDG_DATA_HOME"/wine
export CGDB_DIR=$XDG_CONFIG_HOME/cgdb
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export KDEHOME="$XDG_CONFIG_HOME"/kde
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv/GLCache

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Android SDK
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android

# AWS -- https://github.com/aws/aws-sdk/issues/30#issuecomment-532208981
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_CLI_HISTORY_FILE="$XDG_DATA_HOME/aws/history"
export AWS_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/credentials"
# export AWS_WEB_IDENTITY_TOKEN_FILE="$XDG_DATA_HOME/aws/token"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/shared-credentials"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# GPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# Go
export GOPATH="$XDG_DATA_HOME"/go

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# ipfs -- https://github.com/ipfs/kubo/issues/120#issuecomment-1499794153
export IPFS_PATH="$XDG_DATA_HOME"/ipfs


# Pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

# Python
export PYENV_ROOT=/usr/local/var/pyenv
export PYLINTHOME="$XDG_CACHE_HOME"/pylint.d
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc

# Jupyter / ipython
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

# Rust / Cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# Ruby / Gem
if [ "$OS" = "Darwin" ]; then
    export GEM_HOME="$XDG_DATA_HOME"/gem
    export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
elif [ "$OS" = "Linux" ]; then
    # export GEM_HOME="$PATH:$HOME/.rvm/bin"
fi


# notmuch
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc

# Stack
export STACK_ROOT="$XDG_DATA_HOME"/stack

# Node / npm
# https://github.com/npm/npm/issues/6675#issuecomment-251049832
export NODE_REPL_HISTORY="$XDG_CACHE_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export NVM_DIR="$HOME/.config/nvm"

# taskwarrior
# export TASKRC=$XDG_CONFIG_HOME/task/.taskrc

# tmux / tpm
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME"/tmux/plugins/

# jrnl
export JRNL_TEMPLATE_DIR="$HOME/Desktop/Development/jrnl-templates"

# zsh + tools
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export _Z_DATA="$XDG_CACHE_HOME"/.z

# zinit
export ZINIT_HOME="$XDG_DATA_HOME"/zinit/zinit.git
export ZPFX="$XDG_CACHE_HOME"/polaris


##############
# gcc / OS-Dev
##############

# if [ "$OS" = "Darwin" ]; then
    # export CC=/usr/local/bin/gcc-9
    # export LD=/usr/local/bin/gcc-9
    # export OS_DEV_PREFIX="/Users/alichtman/bin/i386elfgcc"
    # export TARGET=i386-elf
    # export PATH="$OS_DEV_PREFIX/bin:$PATH"
# elif [ "$OS" = "Linux" ]; then
    # export CC=/usr/bin/gcc-9
    # export LD=/usr/bin/gcc-9
# fi

#############
# PATH Config
#############

# TODO: https://www.arp242.net/zshrc.html#easier-path

export PATH="$PATH:/home/alichtman/.local/share/cargo/bin" # starship in root shell hack
export PATH="$PATH:/opt/GoLand/bin/goland.sh"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.poetry/bin"
export PATH="$PATH:$HOME/Applications"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/local"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/sbin"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"


if [ "$OS" = "Darwin" ]; then
    export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
    export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library"
    export PATH="$PATH:/usr/local/Cellar/john-jumbo/1.8.0/share/john"
    export PATH="$PATH:/usr/local/Cellar/node/13.11.0/bin"
    export PATH="$PATH:$HOME/Library/Python/3.7/bin"
    export PATH="$PATH:/usr/local/opt/openssl/bin"
    export PATH="$PATH:/usr/local/opt/llvm/bin"
    export PATH="$PATH:$HOME/.local/share/radare2/prefix/bin"
elif [ "$OS" = "Linux" ]; then
    export PATH="$PATH:/usr/lib/w3m/w3mimgdisplay"
    export PATH="/snap/bin::$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
  if [ -d "$HOME/bin/rofi" ]; then
     PATH="$HOME/bin/rofi:$PATH"
  fi
fi

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.local/share/gem/bin:$PATH"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.1.0/bin"


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Deduplicate entries in PATH
typeset -U PATH
export PATH

# GNU-getopt

if [ $OS = "Darwin" ]; then
    export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
fi

# Python Env

pyenv global 3.11.3

# Go Env

export GO111MODULE="on"

#########
# Ranger
#########

export RANGER_LOAD_DEFAULT_RC=FALSE

###############
# Startup Tasks
###############

if [ "$OS" = "Linux" ]; then
    pgrep greenclip >/dev/null || (bash -c "greenclip daemon > /dev/null 2>&1 &")
fi

# Needed to build things with alsa. Idk why this isn't set by default?
export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig/"

# vim: ts=4 sw=4 tw=0 et ft=zsh :
