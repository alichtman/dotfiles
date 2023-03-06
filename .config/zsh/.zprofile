# .zprofile
# Aaron Lichtman

#######
# pyenv
#######

# If pyenv is on PATH, load it and set the python interpreter version.
if hash pyenv; then
    eval "$(pyenv init -)"
    pyenv global 3.10-dev
    # pyenv global 3.8.1
fi

# vim: ts=4 sw=4 tw=0 et ft=zsh :
