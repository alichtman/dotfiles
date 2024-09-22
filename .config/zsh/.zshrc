# .zshrc for macOS and Linux
# Aaron Lichtman (@alichtman)

# Prompt {{{

# Config in ~/.config/starship.toml
eval "$(starship init zsh)"

# END Prompt }}}

# FZF {{{

# Show hidden files in search and ignore .git directory
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--cycle"
if [ "$OS" = "Darwin" ]; then
    export FZF_BASE="/usr/local/bin/fzf"
elif [ "$OS" = "Linux" ]; then
    export FZF_BASE="/usr/bin/fzf"
fi

# END FZF }}}

# Env Vars {{{

export BETTER_EXCEPTIONS=1     # Python Better Exceptions
export FORCE_COLOR=1

export HOMEBREW_NO_ANALYTICS=1
export NOTES=$HOME/Desktop/Development/notes

# END Env Vars }}}

# ssh {{{

if [ "$OS" = "Darwin" ]; then
    zstyle :omz:plugins:ssh-agent identities alichtman-GitHub alichtman-GitLab rpi-hydrogen
elif [ "$OS" = "Linux" ]; then
    zstyle :omz:plugins:ssh-agent identities alichtman-GitHub alichtman-GitLab alichtman-MBP alichtman-Codeberg
fi

# END ssh }}}

# tmux {{{

# export ZSH_TMUX_AUTOSTART=true
# export ZSH_TMUX_AUTOCONNECT=false
# export ZSH_TMUX_CONFIG="$XDG_CONFIG_HOME/tmux/tmux.conf"
#
# if [ "$OS" = "Darwin" ]; then
    # export ZSH_TMUX_ITERM2=true
# fi

# }}}

# zcomet setup {{{

# clone zcomet if needed {{{
ZCOMET_REPO="${XDG_DATA_HOME:-$HOME/.local/share}/zcomet"
ZCOMET_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zcomet"
if [ ! -d "$ZCOMET_REPO" ]; then
    git clone git@github.com:agkozak/zcomet.git "$ZCOMET_REPO"
fi
# END clone zcomet if needed }}}

source $XDG_DATA_HOME/zcomet/zcomet.zsh

# Put zcomet repo, snippet downloads, and compinit cache in the cache directory
zstyle ':zcomet:*' home-dir $ZCOMET_CACHE
zstyle ':zcomet:compinit' dump-file "$ZCOMET_CACHE/zcompdump"

# zcomet plugins {{{

zcomet load ohmyzsh lib async_prompt.zsh
zcomet load ohmyzsh lib git.zsh
zcomet snippet OMZ::plugins/git/git.plugin.zsh
zcomet snippet OMZ::plugins/fzf/fzf.plugin.zsh
# zcomet snippet OMZ::plugins/tmux/tmux.plugin.zsh
zcomet snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zcomet snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# Other plugins
zcomet load changyuheng/fz
zcomet load rupa/z
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-history-substring-search
zcomet load changyuheng/zsh-interactive-cd
 # zcomet load softmoth/zsh-vim-mode
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions

# END zcomet Plugins }}}

# zsh completions {{{

# https://gist.github.com/ctechols/ca1035271ad134841284?permalink_comment_id=3401477#gistcomment-3401477
skip_global_compinit=1

# Automatically refresh completions
zstyle ':completion:*' rehash true
# Highlight currently selected tab completion
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _expand _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' group-name '' # group results by category

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

# Load completions
fpath=(/usr/local/share/zsh-completions $fpath)

zcomet compinit

# END zsh completions }}}

# END zcomet setup }}}

# pyenv {{{

# If pyenv is on PATH, load it and set the python interpreter version.
if hash pyenv; then
    eval "$(pyenv init -)"
    pyenv global 3.12.4
fi

# END pyenv}}}

# changyuheng/fz {{{

export FZ_CMD=j
export FZ_SUBDIR_CMD=jj

# }}}

# zsh-history-substring-search {{{

setopt HIST_IGNORE_ALL_DUPS

# Bind up and down arrow keys

if [ "$OS" = "Darwin" ]; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
elif [ "$OS" = "Linux" ]; then
    # https://superuser.com/a/1296543
    # key dict is defined in /etc/zshrc
    bindkey "$key[Up]" history-substring-search-up
    bindkey "$key[Down]" history-substring-search-down
fi

# Bind j and k for in vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# END zsh-history-substring-search }}}

# ruby / rbenv {{{
# eval "$(rbenv init - zsh)"
# }}}

# Make ... work like cd ../.. {{{

# I don't understand how this works, but it is one of my favorite zsh snippets ever
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

# END Make .... work like cd ../.. }}}

# General zsh Behavior {{{

# Allow comments in interactive shell
setopt interactive_comments

# cd without needing "cd"
setopt auto_cd

# Fix $ git reset --soft HEAD^ error.
unsetopt nomatch

# Append a trailing `/' to all directory names resulting from globbing
setopt mark_dirs

set termguicolors

# Shift+Tab to get reverse menu completion
bindkey '^[[Z' reverse-menu-complete

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

# nnn {{{

export NNN_TMPFILE='/tmp/.lastd' # cd on exit
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip)$"
export NNN_PLUG='f:finder;o:fzopen;O:!xdg-open $nnn;p:preview-tabbed;d:diffs;t:nmount;v:imgview;u:upload;x:!chmod +x $nnn'
export NNN_ORDER='t:/home/user/Downloads;S:/usr/bin'
export NNN_TRASH=1 # trash-cli
export NNN_HELP='pwy paris'

BLK="0B" CHR="0B" DIR="04" EXE="06" REG="01" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# }}}

# Vim Mode {{{

bindkey -v

# Reduce mode change delay (in hundreths of a second)
export KEYTIMEOUT=5

# Enable ESC-V to edit current command in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^V" edit-command-line

# Hit jk to enter NORMAL mode. You basically have to hit them at the same time.
bindkey -s jk \\e

# TODO: Allow backspace over newline

# TODO: BUG: Doesn't work with symbol changing for prompt
# https://github.com/LukeSmithxyz/voidrice/blob/33e329c8cb44679c37054d1823ef487c2569fcdc/.config/zsh/.zshrc#L26-L56

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

# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# END Disarm rm }}}

# Sourcing Other Files {{{

SECRETS_FILE="$XDG_CONFIG_HOME/.secrets"
[ -f "$SECRETS_FILE" ] && source "$SECRETS_FILE"

# Load other dotfiles
for file in $XDG_CONFIG_HOME/zsh/.{aliases,zfunctions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# END Sourcing Other Files }}}

# Startup Tools / Sequence {{{

year-progress
tls

if [ "$OS" = "Darwin" ]; then
	test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh" || true
fi

# If tmux is not running already, start it in the Background
if ! pgrep "tmux" > /dev/null
then
    tmux new-session -d -s default
else
    # TODO: Need to make sure we're not in a typing-sensitive environment (like vim or a python repl)
    # tmux send -t default "/usr/bin/cat $ZDOTDIR/reattached-to-default-tmux-sesion-notice.txt" ENTER
    # tmux send -t default tls ENTER
    if [ -z "$TMUX" ]; then
        # If default session doesn't exist, create it
        tmux has-session -t default || tmux new-session -d -s default
        # then attach to it
        tmux attach-session -t default
    fi
fi

# END Startup Tools }}}

# nvm {{{

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# }}}

# vim: foldmethod=marker foldcolumn=1 et
