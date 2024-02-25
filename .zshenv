export PATH="/Users/pthurston/.local/bin:$PATH"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_BIN_HOME=$HOME/.local/bin

export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/asdfrc
export ASDF_DIR=$HOME/.local/asdf
export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf

[ -f $HOME/.variables ] && source $HOME/.variables
alias assume=". assume"
