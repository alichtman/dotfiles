# .zshrc for macOS
# Aaron Lichtman (@alichtman)

# Prompt {{{

# Config in ~/.config/starship.toml
eval "$(starship init zsh)"

# END Prompt }}}

# FZF {{{

# Show hidden files in search and ignore .git directory
export FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/.config/agignore -l -g ""'
export FZF_DEFAULT_OPTS="--cycle"
export FZF_BASE="/usr/local/bin/fzf"

# END FZF }}}

# Env Vars {{{

export BETTER_EXCEPTIONS=1     # Python Better Exceptions
export HOMEBREW_NO_ANALYTICS=1
export BAT_THEME="TwoDark"
export NOTES=$HOME/Desktop/Development/notes

# END Env Vars }}}

# Plugins {{{

source "$ZDOTDIR/.zinit/bin/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# oh-my-zsh plugins
zinit ice wait'!'
zinit snippet OMZ::lib/git.zsh
zinit ice wait'!'
zinit snippet OMZP::git
zinit ice wait'!'
zinit snippet OMZP::fzf
zinit ice wait'!'
zinit snippet OMZP::ssh-agent

# GitHub Plugins

# https://github.com/zdharma/zinit-configs/blob/a60ff64823778969ce2b66230fd8cfb1a957fe89/psprint/zshrc.zsh#L277
# Fast-syntax-highlighting & autosuggestions
zinit wait lucid for \
 silent atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf \
    zsh-users/zsh-completions \
 atload"!export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=yellow,fg=white,bold'" \
    zsh-users/zsh-history-substring-search \
 pick"zsh-interactive-cd.plugin.zsh" \
    changyuheng/zsh-interactive-cd \
 pick"z.sh" \
    rupa/z \
 pick"fz.plugin.zsh" \
    changyuheng/fz \
 pick"git-it-on.plugin.zsh" \
    peterhurford/git-it-on.zsh

# Install my custom completions
zinit creinstall -q $ZDOTDIR/completions

# END Plugins }}}

# zsh-history-substring-search {{{

setopt HIST_IGNORE_ALL_DUPS

# Bind up and down arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind j and k for in vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# END zsh-history-substring-search }}}

# z and fz {{{

FZ_CMD=j
FZ_SUBDIR_CMD=jj

# END z and fz }}}

# ssh {{{

if [ "$OS" = "Darwin" ]; then
    zstyle :omz:plugins:ssh-agent identities alichtman-GitHub alichtman-GitLab rpi_hydrogen rpi_krypton cs421
elif [ "$OS" = "Linux" ]; then
    zstyle :omz:plugins:ssh-agent identities alichtman-GitHub
fi

# END ssh }}}

# Completion {{{

# Automatically refresh completions
zstyle ':completion:*' rehash true

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
autoload -U compinit && compinit -d $XDG_CACHE_HOME/zcompdump/default

# END Completion }}}

# General zsh Behavior {{{

set termguicolors

# cd without needing "cd"
setopt auto_cd

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
export HISTFILE="$XDG_CACHE_HOME/.zsh_history"

# END History }}}

# vim {{{

# Reduce mode change delay to 0.05 seconds
export KEYTIMEOUT=05

# Enable ESC-v to edit current command in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# END vim }}}

# Backgrounding and Unbackgrounding {{{

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

# END Backgrounding and Unbackgrounding }}}

# Disarm rm {{{

# rm aliased to safe-rm in ~/.aliases

# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# END Disarm rm }}}

# Sourcing Other Files {{{

source "$HOME/.secrets"

# Load other dotfiles
for file in $XDG_CONFIG_HOME/zsh/.{aliases,zfunctions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# END Sourcing Other Files }}}

# Startup Tools {{{

function execute_cmd_if_exists() {
    if hash "$1" 2>/dev/null; then
        "$1"
    fi
}

execute_cmd_if_exists year-progress
execute_cmd_if_exists tls

# END Startup Tools }}}

# vim: foldmethod=marker foldcolumn=1 et