# .zprofile
# Aaron Lichtman

#########
# Editors
#########

export EDITOR='nvim'
export VISUAL='nvim'
export VIMCONFIG='$HOME/.config/nvim'

#######################
# Directories and Files
#######################

export PYLINTRC='~/.pylintrc'
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go
export SPLUNK_HOME=/Applications/Splunk
export PYENV_ROOT=/usr/local/var/pyenv

######
# PATH
######

export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/Cellar/john-jumbo/1.8.0/share/john"
export PATH="$PATH:/Users/alichtman/.local/share/radare2/prefix/bin"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/local"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library"
export PATH="$PATH:/usr/local/Cellar/node/12.12.0/bin"
export PATH="$PATH:/Users/alichtman/Library/Python/3.7/bin"
export PATH="$PATH:$SPLUNK_HOME/bin"
export PATH="$PATH:$GOPATH/bin"

#######
# pyenv
#######

eval "$(pyenv init -)"
pyenv global 3.8.0

export PATH="$HOME/.poetry/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"

export LSCOLORS=GxFxCxDxBxegedabagaced

# Deduplicate entries in PATH
typeset -U PATH
export PATH
