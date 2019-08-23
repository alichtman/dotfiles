# .zprofile
# Aaron Lichtman

# Setting PATH for Python 3.7
export PATH="$PATH:/usr/local/Cellar/python3/3.7.3/Frameworks/Python.framework/Versions/3.7/bin"
export PATH="$PATH:/usr/local/Cellar/python3/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages"

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/Cellar/john-jumbo/1.8.0/share/john"
export PATH="$PATH:/Users/alichtman/.local/share/radare2/prefix/bin"

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/local"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library"

# Splunk
export SPLUNK_HOME=/Applications/Splunk
export PATH="$PATH:$SPLUNK_HOME/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"

