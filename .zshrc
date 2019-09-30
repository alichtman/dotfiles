# .zshrc for macOS
# Aaron Lichtman

########
# Prompt
########

# Config in ~/.config/starship.toml
eval "$(starship init zsh)"

##########
# Env Vars
##########

export PYLINTRC='~/.pylintrc'
export BETTER_EXCEPTIONS=1 # Python Better Exceptions
export HOMEBREW_NO_ANALYTICS=1
export BAT_THEME="TwoDark"
export EDITOR='nvim'
export VISUAL='nvim'
export ZSH=$HOME/.oh-my-zsh
export NOTES=$HOME/Desktop/Development/notes

export ZSH_STARTIFY_NO_SPLASH=true
export ZSH_STARTIFY_NON_INTERACTIVE=true

#########
# Plugins
#########

# oh-my-zsh
# Plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  fzf
  git
  tmux
  ssh-agent
  zsh-autosuggestions
  zsh-completions
)

# zplug
source ~/.zplug/init.zsh

zplug "changyuheng/zsh-interactive-cd"
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

#####
# ssh
#####

zstyle :omz:plugins:ssh-agent identities alichtman-GitHub alichtman-GitLab rpi_hydrogen rpi_krypton

############
# Completion
############

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# Use hyphen-insensitive completion. Case sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Include dotfiles in completions
setopt globdots

# homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# My custom completions
fpath=("~/.config/zsh/completions" $fpath)

# pip zsh completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

# type '...' to get '../..'
function _rationalise-dot() {
  local MATCH MBEGIN MEND
  if [[ $LBUFFER =~ '(^|/| |    |'$'\n''|\||;|&)\.\.$' ]]; then
    LBUFFER+=/
    zle self-insert
  fi
  zle self-insert
}
zle -N _rationalise-dot
bindkey . _rationalise-dot
# without this, typing a . aborts incremental history search
bindkey -M isearch . self-insert

# Load completions
autoload -U compinit && compinit

######
# tmux
######

export ZSH_TMUX_AUTOQUIT=false

######################
# General zsh Behavior
######################

set termguicolors

# Fix $ git reset --soft HEAD^ error.
unsetopt nomatch

# History date format
HIST_STAMPS="mm/dd/yyyy"

# fz config
FZ_CMD=j
FZ_SUBDIR_CMD=jj

###########################
# Looking out for future me.
###########################

alias rm="safe-rm"
# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

############
# FZF Config
############

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh;

# Show hidden files in search and ignore .git directory
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_OPTS="--cycle"

######################
# Sourcing Other Files
######################

source $ZSH/oh-my-zsh.sh

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.zfunctions ]; then
	source ~/.zfunctions
fi

if [ -f ~/.secrets ]; then
	source ~/.secrets
fi

source ~/.zprofile
zplug load

zsh-startify
