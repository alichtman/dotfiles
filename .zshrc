# .zshrc for macOS
# Aaron Lichtman (@alichtman)

# TODO {{{

# - Migrate .fzf.zsh out of $ZSH_CUSTOM and uninstall oh-my-zsh

# }}}

# Prompt {{{

# Config in ~/.config/starship.toml
eval "$(starship init zsh)"

# END Prompt }}}

# FZF {{{

# Show hidden files in search and ignore .git directory
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_OPTS="--cycle"
export FZF_BASE="/usr/local/bin/fzf"

# END FZF }}}

# Env Vars {{{

export BETTER_EXCEPTIONS=1     # Python Better Exceptions
export HOMEBREW_NO_ANALYTICS=1
export BAT_THEME="TwoDark"
export NOTES=$HOME/Desktop/Development/notes

# zsh-startify
export ZSH_STARTIFY_NO_SPLASH=true
export ZSH_STARTIFY_NON_INTERACTIVE=true

# END Env Vars }}}

# Plugins {{{

plugins=(
  ssh-agent
  fzf
)

source $HOME/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# oh-my-zsh plugins
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/fzf/fzf.plugin.zsh
zplugin snippet OMZ::plugins/tmux/tmux.plugin.zsh
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

# GitHub Plugins
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions

zplugin ice wait'!' pick"zsh-interactive-cd.plugin.zsh"
zplugin light "changyuheng/zsh-interactive-cd"
zplugin ice wait'!' pick"z.sh"
zplugin light "rupa/z"
zplugin ice wait'!' pick"fz.plugin.zsh"
zplugin light "changyuheng/fz"
zplgin ice wait
zplugin light peterhurford/git-it-on.zsh

# END Plugins }}}

# z and fz {{{

FZ_CMD=j
FZ_SUBDIR_CMD=jj

# END z and fz }}}

# ssh {{{

zstyle :omz:plugins:ssh-agent identities alichtman-GitHub alichtman-GitLab rpi_hydrogen rpi_krypton

# END ssh }}}

# Completion {{{

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

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

# END Completion }}}

# tmux {{{

export ZSH_TMUX_AUTOQUIT=false

# END tmux }}}

# General zsh Behavior {{{

set termguicolors

# Fix $ git reset --soft HEAD^ error.
unsetopt nomatch

# Append a trailing `/' to all directory names resulting from globbing
setopt mark_dirs

# END General zsh Behavior }}}

# History {{{

setopt inc_append_history   # append history list to the history file (important for multiple parallel zsh sessions!)
setopt share_history        # import new commands from the history file also in other zsh-session
setopt extended_history     # save each command beginning timestamp and the duration to the history file
setopt hist_ignore_space    # remove command lines from the history list when the first character on the line is a space

export HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

# END History }}}

# vim {{{

# Enable Ctrl-x-e to edit current command in vim
autoload -U edit-command-line

# Use Ctrl-z swap in and out of vim (or any other process)
# https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
function ctrl-z-toggle () {
  if [[ $#BUFFER -eq 0 ]]; then
	BUFFER="setopt monitor && fg"
	zle accept-line
  else
	zle push-input
	zle clear-screen
  fi
}
zle -N ctrl-z-toggle
bindkey '^Z' ctrl-z-toggle

# END vim }}}

# Disarm rm {{{

# rm aliased to safe-rm in ~/.aliases

# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# END Disarm rm }}}

# Sourcing Other Files {{{

source $ZSH/oh-my-zsh.sh

# Load other dotfiles
for file in ~/.{aliases,zfunctions,zprofile,secrets}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# END Sourcing Other Files }}}

# Startup Tools {{{

year-progress
zsh-startify

# END Startup Tools }}}

# vim: foldmethod=marker foldcolumn=1
