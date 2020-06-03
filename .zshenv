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
export VISUAL='nvim'

#####
# XDG
#####

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

############################
# House Cleaning (~ cleanup)
############################

export ELECTRUMDIR="$XDG_DATA_HOME"/electrum
export GRIPHOME="$XDG_CONFIG_HOME"/grip
export LESSHISTFILE="$XDG_CACHE_HOME"/lesshst
export MPLCONFIGDIR="$XDG_CONFIG_HOME"/matplotlib
export WAKATIME_HOME="$XDG_CONFIG_HOME"/wakatime

# Atom
export ATOM_HOME="$XDG_DATA_HOME"/atom

# Android SDK
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# GPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# Go
export GOPATH="$XDG_DATA_HOME"/go

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

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
    unset GEM_HOME
fi


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

# zsh + tools
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export _Z_DATA="$XDG_CACHE_HOME"/.z

# zinit
declare -A ZINIT
ZINIT[HOME_DIR]="$ZDOTDIR"/.zinit
ZINIT[BIN_DIR]="$ZDOTDIR"/.zinit/bin
ZINIT[PLUGINS_DIR]="$ZDOTDIR"/.zinit/plugins
ZINIT[COMPLETIONS_DIR]="$ZDOTDIR"/.zinit/completions
ZINIT[SNIPPETS_DIR]="$ZDOTDIR"/.zinit/snippets
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME"/zcompdump/zcompdump-zinit

##############
# gcc / OS-Dev
##############

if [ "$OS" = "Darwin" ]; then
    export CC=/usr/local/bin/gcc-9
    export LD=/usr/local/bin/gcc-9
    export OS_DEV_PREFIX="/Users/alichtman/bin/i386elfgcc"
    export TARGET=i386-elf
    export PATH="$OS_DEV_PREFIX/bin:$PATH"
elif [ "$OS" = "Linux" ]; then
    export CC=/usr/bin/gcc-9
    export LD=/usr/bin/gcc-9
fi

#############
# PATH Config
#############

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
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
  if [ -d "$HOME/bin/rofi" ]; then
     PATH="$HOME/bin/rofi:$PATH"
  fi
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Deduplicate entries in PATH
typeset -U PATH
export PATH

# GNU-getopt

if [ $OS = "Darwin" ]; then
    export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
fi


#########
# Ranger
#########

export RANGER_LOAD_DEFAULT_RC=FALSE

###############
# Startup Tasks
###############

if [ "$OS" = "Linux" ]; then
    pgrep sxhkd >/dev/null || (bash -c "sxhkd &> /dev/null &")
fi

# vim: ts=4 sw=4 tw=0 et ft=zsh :
