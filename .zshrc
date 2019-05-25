# .zshrc for macOS
# Aaron Lichtman

#########
# THEMES
#########

ZSH_THEME="spaceship"
#ZSH_THEME="agnoster"

#########
# Spaceship Config
#########

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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  #zsh-syntax-highlighting
  zsh-autosuggestions
)

fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit

set termguicolors
unsetopt nomatch # Fix $ git reset --soft HEAD^ error.

export EDITOR='nvim'
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
export BAT_THEME="1337"

###
# Aliases
###

# ls
alias ls='LC_COLLATE=cs_CZ.ISO8859-2 colorls -1A --sd --gs'
alias ll='LC_COLLATE=cs_CZ.ISO8859-2 colorls -1A --sd -l --gs'
alias lsd='lsd -1a'
alias exa='exa -1a -s Name --group-directories-first'

alias ip='ipconfig getifaddr en0'
alias brewup='brew update; brew upgrade; brew cask upgrade; brew cleanup; brew doctor'
alias pipes='pipes.sh -f 75 -t 3 -B'
alias changelog='github_changelog_generator'
alias matrix='unimatrix -s 93'
alias news="newsroom"
alias activate=". venv/bin/activate"
alias please="sudo"
alias google="googler"
alias fuck='eval $(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $(fc -ln -1))'
alias cargo-update='cargo install-update -a'
alias update='cargo-update; brewup; apm upgrade; rustup;'
alias kill-touchbar='sudo pkill "Touch Bar agent";sudo killall "ControlStrip";'
alias unthrottle-time-machine='sudo sysctl debug.lowpri_throttle_enabled=0;'
alias throttle-time-machine='sudo sysctl debug.lowpri_throttle_enabled=1;'
#alias vim='mvim -v -S ~/.vimrc' # macvim errors on start up (?) and I don't care enough to debug it so now I'm an neovim guy, I guess.
alias vim='nvim'
alias spacemacs='emacs'
alias xbuild='/Library/Frameworks/Mono.framework/Versions/5.12.0/bin/xbuild'
alias xcode='open -a Xcode'
alias trip='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'
alias vol='volatility --plugins=/Users/alichtman/volatility-plugins'

#alias ling490mount='sshfs aaronjl2@cl.linguistics.illinois.edu:/home/aaronjl2 ~/Desktop/LING490'
#alias ling490unmount='umount -f ~/Desktop/LING490'

alias rc='radix-calc'
alias rcc='radix-calc --all'

######
# Looking out for future me.
######

alias rm="safe-rm"
# Prompt to confirm rm DIR/*
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

###
# Pypi
###

# Test upload
alias pypitestup='python3 setup.py bdist_wheel; twine upload --repository testpypi dist/*'
# Test download and install
alias pip3test='pip3 install --index-url https://test.pypi.org/simple/'
# Deployment upload
alias pypiup='python3 setup.py bdist_wheel; twine upload --repository pypi dist/*'
# Generate binary for distribution (?)
alias pypibinary='python3 setup.py sdist'

# ANTLR
export CLASSPATH=".:/usr/local/lib/antlr-4.7-complete.jar:$CLASSPATH"
# Tool to generate lexer and parser
alias antlr4='java -jar /usr/local/lib/antlr-4.7-complete.jar'
# Tool to test the generated code
alias grun='java org.antlr.v4.gui.TestRig'

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Clean up prompt. Ok, so honestly not too sure what this does but I don't want to remove it either so... here we are.
prompt_context() {}

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

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
# dito for searching in menu selection
bindkey -M menuselect . self-insert

## FZF FUNCTIONS ##

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fuzzy File Search
# fo [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fo() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Fuzzy History Search
# fh [FUZZY PATTERN] - Search in command history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

#### Transfer.sh
#transfer() {
#  curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
#}

#alias transfer=transfer

# Python Better Exceptions
export BETTER_EXCEPTIONS=1
export HOMEBREW_NO_ANALYTICS=1

# Hide secrets
source ~/.api-keys-and-tokens
