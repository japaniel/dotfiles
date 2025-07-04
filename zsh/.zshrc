export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  kubectl
  terraform
  pyenv
  history-substring-search
  command-not-found
)

source $ZSH/oh-my-zsh.sh

setopt AUTO_CD
setopt CORRECT_ALL
setopt SHARE_HISTORY
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# ===== Development Environment Configuration =====

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$PATH:$HOME/.local/bin"
eval "$(register-python-argcomplete pipx)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export GOPATH="$HOME/go"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

export PATH="$HOME/.tfenv/bin:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# Google Cloud SDK
if [ -f "$HOME/downloads/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/downloads/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/downloads/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/downloads/google-cloud-sdk/completion.zsh.inc"
fi
if [ -f '/home/dredington/google-cloud-sdk/path.zsh.inc' ]; then
  . '/home/dredington/google-cloud-sdk/path.zsh.inc'
fi
if [ -f '/home/dredington/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/home/dredington/google-cloud-sdk/completion.zsh.inc'
fi

export DOCKER_HOST=unix:///var/run/docker.sock

if [[ $(uname -s) == "Darwin" ]]; then
	export PATH=$PATH:/opt/homebrew/bin
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ===== End Development Environment Configuration =====

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

alias terraform="noglob terraform"
alias yamllint="yamllint -s . -fparsable"

if [[ $(basename $SHELL) == "bash" ]]; then
	autoload -U bashcompinit
	bashcompinit
fi
