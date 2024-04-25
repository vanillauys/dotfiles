# Omz
export ZSH="$HOME/.oh-my-zsh"

# Path
export SSH_AUTH_SOCK=~/.1password/agent.sock
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json
export PATH=$PATH:/var/lib/snapd/snap/bin:/home/wihanu/.local/bin

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    history
)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Environment variables
export NPMRC_TOKEN="op://glyde/glyde_github_personal_access_token/token"
export GIT_KEY="op://glyde/glyde_github_personal_access_token/token"

# Aliases
alias update="yay -Syyu --noconfirm && yay -Scc --noconfirm && omz update" 
alias clip="xclip -selection clipboard"

# Dev Aliases
alias vim="nvim "
alias boot="./gradlew bootRun"
alias dbup="cd glyde/backend/cbs-api/docker && ./up && cd .."
alias fbranch='git branch | cut -c 3- | gum filter | xargs -I {} git checkout {} && git pull'
alias ccbranch='git branch | grep "*" | cut -c 3- | clip'
alias dbranch='git branch | cut -c 3- | gum choose --no-limit | xargs -I {} git branch -D {}'
alias prs='gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout'
alias fuckit="reset --hard"
alias git="git "

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# ~/.zshrc
eval "$(starship init zsh)"

# Created by `pipx` on 2024-04-22 12:37:54
export PATH="$PATH:/home/wihanu/.local/bin"
