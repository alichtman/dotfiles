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

# zsh-startify
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

##########
# z and fz
##########

FZ_CMD=j
FZ_SUBDIR_CMD=jj

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
# Please don't ask me how this works. I have absolutely no idea.
# Mikel Magnusson <mikachu@gmail.com> wrote this.
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
fpath=(/usr/local/share/zsh-completions $fpath)
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

# Append a trailing `/' to all directory names resulting from globbing
setopt mark_dirs

#########
# History
#########

setopt inc_append_history   # append history list to the history file (important for multiple parallel zsh sessions!)
setopt share_history        # import new commands from the history file also in other zsh-session
setopt extended_history     # save each command's beginning timestamp and the duration to the history file
setopt hist_ignore_space    # remove command lines from the history list when the first character on the line is a space

export HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

#####
# vim
#####

# Enable Ctrl-x-e to edit current command in vim
autoload -U edit-command-line

# Use Ctrl-z swap in and out of vim (or any other process)
# https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
	BUFFER="setopt monitor && fg"
	zle accept-line
  else
	zle push-input
	zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

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

# Load other dotfiles
for file in ~/.{aliases,zfunctions,zprofile,secrets}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

zplug load

zsh-startify
