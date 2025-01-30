### Helper functions
include () {
    [[ -f "$1" ]] && source "$1" 2> /dev/null
}
###

export ZSH="$HOME/.oh-my-zsh"

fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Source Antigen correctly across macOS/NixOS
include /opt/homebrew/share/antigen/antigen.zsh
include $HOME/.local/share/antigen.zsh

### Plugins - Manged by Antigen (brew install antigen)
antigen use oh-my-zsh

antigen bundle git
antigen bundle docker
antigen bundle sudo
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# Source autojump correctly across macOS/NixOS
include $HOME/.local/share/autojump.sh
include /opt/homebrew/etc/profile.d/autojump.sh

###

### User configuration

### Prompt (prereq: brew install pure)
include  $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure
###

## Path
include $HOME/.bashrc
include $HOME/.bash_aliases
# Source here for aliases not synced in this repo (private)
include $HOME/.private_aliases

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# GCP (prereq: brew install --cask google-cloud-sdk)
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# NVM (prereq: brew install nvm)
export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# nvm auto load
autoload -U add-zsh-hook
load-nvmrc() {
  [[ -a .nvmrc ]] || return
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [[ $nvmrc_node_version != N/A && $nvmrc_node_version != $node_version ]]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc    
