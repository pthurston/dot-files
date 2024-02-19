# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  _______ _  _    ___           __ _
# |_  / __| || |  / __|___ _ _  / _(_)__ _
#  / /\__ \ __ | | (__/ _ \ ' \|  _| / _` |
# /___|___/_||_|  \___\___/_||_|_| |_\__, |
#                                    |___/

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_THEME="powerlevel10k/powerlevel10k"

HYPHEN_INSENSITIVE="true" # _ and - will be interchangeable for command completion.

DISABLE_MAGIC_FUNCTIONS="true" # Prevent issues when pasting urls

DISABLE_UNTRACKED_FILES_DIRTY="true" # Improve status checks in large repos

HIST_STAMPS="yyyy-mm-dd" # Command history format
HISTFILE=$HOME/.cache/.zsh_history

zstyle ':omz:update' mode reminder # Send reminders for Oh-My-ZSH updates, can be: disabled, auto, or reminder
zstyle ':omz:plugins:nvm' lazy yes # Lazy load nvm

plugins=(asdf zsh-autosuggestions) # Standard plugins can be found in $ZSH/plugins/, custom plugins in $ZSH_CUSTOM/plugins

fpath=($HOME/.granted/zsh_autocomplete/assume/ $fpath)
fpath=($HOME/.granted/zsh_autocomplete/granted/ $fpath)
fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit && compinit

setopt HIST_IGNORE_SPACE
source $ZSH/oh-my-zsh.sh

### HOMEBREW ###
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
eval "$(brew shellenv)"
# path+=("$(brew --prefix)/sbin") # Include sbin directory in path

# Add postgres tools like psql to path
path+=("$(brew --prefix postgresql@15)/bin")

export LESSHISTFILE=-
export EDITOR=micro

export PYTHONSTARTUP=~/.config/python/pythonrc


# Put asdf shims to the beginning of the path
path=(
  $ASDF_DIR/shims
  $path
)

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

if [ -f ~/.config/op/plugins.sh ]; then
    source ~/.config/op/plugins.sh
fi

# Load asdf
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && . /opt/homebrew/opt/asdf/libexec/asdf.sh

# Set GOROOT based on asdf-go plugin
[ -f ~/.asdf/plugins/golang/set-env.zsh ] && . ~/.asdf/plugins/golang/set-env.zsh

# Source direnv using the asdf-direnv plugin
[ -f "$XDG_CONFIG_HOME/asdf-direnv/zshrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
