# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# prompt
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/star.json)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias cat=bat
alias s="kitten ssh"
alias ls='ls --color'
alias vim='nvim'
alias c=clear
alias z=cd
alias air='~/Utils/go/bin/air'
alias ll='ls -la'
alias vi=nvim

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# bun completions
[ -s "/home/croxymoc/.bun/_bun" ] && source "/home/croxymoc/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# venv
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

source <(fzf --zsh)

# Golang
export GOPATH=$HOME/Utils/go
export GOBIN=$GOPATH/bin
export GOMODCACHE=$GOPATH/pkg/mod
export PATH=$PATH:$GOBIN

alias neofetch=fastfetch
alias firefox=firefox-developer-edition

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/croxymoc/Utils/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/croxymoc/Utils/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/croxymoc/Utils/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/croxymoc/Utils/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/croxymoc/Utils/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/croxymoc/Utils/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

