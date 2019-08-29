# .zshrc for macOS
# Aaron Lichtman

################
# Prompt Styling
################

ZSH_THEME="spaceship"
#ZSH_THEME="agnoster"

# Spaceship Config
if [ $ZSH_THEME = "spaceship" ]; then
  SPACESHIP_TIME_SHOW=true
  SPACESHIP_TIME_12HR=true
  SPACESHIP_TIME_FORMAT=%@
  SPACESHIP_TIME_PREFIX="at"
  SPACESHIP_DIR_TRUNC_PREFIX=""
  SPACESHIP_DIR_COLOR="yellow"
  SPACESHIP_GIT_BRANCH_COLOR="cyan"
  SPACESHIP_CHAR_SYMBOL="➜ "
  SPACESHIP_CHAR_SYMBOL_ROOT="# "
  SPACESHIP_PROMPT_DEFAULT_PREFIX="with "
  SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "

  SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    exec_time     # Execution time
    line_sep      # Line break
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )

  SPACESHIP_RPROMPT_ORDER=(
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    docker        # Docker section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    time
  )
fi


##########
# Env Vars
##########

export BETTER_EXCEPTIONS=1 # Python Better Exceptions
export HOMEBREW_NO_ANALYTICS=1
export BAT_THEME="TwoDark"
export EDITOR='nvim'
export VISUAL='nvim'
export ZSH=$HOME/.oh-my-zsh
export NOTES=$HOME/Desktop/Development/notes

###################
# oh-my-zsh Plugins
###################

# Plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  fzf
  git
  tmux
  zsh-autosuggestions
  zsh-completions
)

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

autoload -U compinit && compinit

######
# tmux
######

export ZSH_TMUX_AUTOQUIT=false

# Always work in a tmux session if tmux is installed
# https://github.com/chrishunt/dot-files/blob/master/.zshrc
# TODO: Fix "duplicate session" bug
#if which tmux 2>&1 >/dev/null; then
#  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    # tmux attach -t carbon || tmux new -s carbon;
  # fi
# fi

######################
# General zsh Behavior
######################

set termguicolors

# Fix $ git reset --soft HEAD^ error.
unsetopt nomatch

# History date format
HIST_STAMPS="mm/dd/yyyy"

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
source $ZSH/oh-my-zsh.sh
zplug load

zsh-startify
