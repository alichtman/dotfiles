# .bash_profile
# Aaron Lichtman

###
# Warning: I use zsh and this bash_profile is woefully incomplete. It works, but it doesn't do much.
###

#Bash Autocompletion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#Changes prompt setting colors and layout
PS1="[\t \u@\h:\w ] $ "

export CLICOLOR=1

LSCOLORS=exfxcxdxbxegedabagacad

#theFuck
eval $(thefuck --alias fuck)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
