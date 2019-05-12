# .zprofile
# Aaron Lichtman

# Splunk
export SPLUNK_HOME=/Applications/Splunk
export PATH=$SPLUNK_HOME/bin:$PATH

# Setting PATH for Python 3.6
# The original version is saved in .zprofile.pysave
export PATH="$PATH:$HOME/Library/Python/3.6/lib"
export PATH="$PATH:$HOME/Library/Python/3.6/lib/python/site-packages"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/Cellar/node/11.6.0/bin"
export PATH="$PATH:/usr/local/Cellar/john-jumbo/1.8.0/share/john"
export PATH="$PATH:$GOPATH/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/Library/Python/3.6/bin:$PATH"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/local"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library"
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export GOPATH=$HOME/go

