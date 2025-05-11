#  _______ _  _    ___           __ _
# |_  / __| || |  / __|___ _ _  / _(_)__ _
#  / /\__ \ __ | | (__/ _ \ ' \|  _| / _` |
# /___|___/_||_|  \___\___/_||_|_| |_\__, |
#                                    |___/

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# ZSH_THEME="powerlevel10k/powerlevel10k"

HYPHEN_INSENSITIVE="true" # _ and - will be interchangeable for command completion.

DISABLE_MAGIC_FUNCTIONS="true" # Prevent issues when pasting urls

DISABLE_UNTRACKED_FILES_DIRTY="true" # Improve status checks in large repos

HIST_STAMPS="yyyy-mm-dd" # Command history format
HISTFILE=$HOME/.cache/.zsh_history

# zstyle ':omz:update' mode reminder # Send reminders for Oh-My-ZSH updates, can be: disabled, auto, or reminder
# zstyle ':omz:plugins:nvm' lazy yes # Lazy load nvm

# plugins=(asdf zsh-autosuggestions) # Standard plugins can be found in $ZSH/plugins/, custom plugins in $ZSH_CUSTOM/plugins

granted completion -s zsh
fpath=(${ASDF_DIR}/completions $fpath)

# autoload -Uz compinit && compinit

setopt HIST_IGNORE_SPACE
# source $ZSH/oh-my-zsh.sh

# ZSH Plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

### HOMEBREW ###
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
eval "$(brew shellenv)"
# path+=("$(brew --prefix)/sbin") # Include sbin directory in path

# Add postgres tools like psql to path
path+=("$(brew --prefix postgresql@15)/bin")

export LESSHISTFILE=-
export EDITOR=micro



#     _    _ _
#    / \  | (_) __ _ ___  ___  ___
#   / _ \ | | |/ _` / __|/ _ \/ __|
#  / ___ \| | | (_| \__ \  __/\__ \
# /_/   \_\_|_|\__,_|___/\___||___/


alias path="echo $PATH | tr ':' '\n'"
command -v eza > /dev/null && alias ls="eza -al"
alias ip="curl https://ipinfo.io"
alias g="git"
alias gc="git checkout"
alias gb="git branch"


eval "$(/Users/pthurston/.local/bin/mise activate zsh)"
eval "$(starship init zsh)"
