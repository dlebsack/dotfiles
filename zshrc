autoload -Uz compinit
compinit

# share history bewtween sessions for instance history search
setopt share_history

# enabled substring history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

#spaceship config
source "$HOME/.zsh/spaceship/spaceship.zsh"

# prompt settings
COMPLETION_WAITING_DOTS="true"

# prompt items
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_JAVA_SHOW=false
SPACESHIP_DOCKER_COMPOSE_SHOW=false

# kubectl prompt
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_ASYNC=true
SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(
    red production
    yellow staging
)

# exports
export LANG=en_US.UTF-8
export LC_MESSAGES="C"
export EDITOR='nvim'
export PATH="$HOME/.node/bin:$GOPATH/bin:$PATH"
export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"

# go settings
export GOPATH=$HOME
export GOPRIVATE="bitbucket.org/dialsource,go.buf.build,buf.build/gen/go"
export GODIR=$HOME/go

# buf settings for docker builds
export BUF_NETRC=$(cat ~/.netrc)

# weechat settings
export WEECHAT_HOME=~/.weechat
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# default tag version for docker builds
export TAG_VERSION=latest

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# #ssh
alias ssh='ssh -A'
# for docker builds
export SSH_KEY_PATH="~/.ssh/id_ecdsa.pub"
export SSH_PRIVATE_KEY=$(cat ~/.ssh/id_ecdsa)
# eval $(ssh-agent) > /dev/null
# ssh-add ~/.ssh/id_rsa 2&> /dev/null

# colors tbd if needed
alias tmux="TERM=screen-256color-bce tmux"

# ssh alias
alias cw-iad-1='ssh root@cw-iad-1.dialsource.com'
alias cw-dfw-1='ssh root@cw-dfw-1.dialsource.com'

# gcloud alias
alias development="gcloud container clusters get-credentials conquer-development --region us-east4 --project dialsource-213300"
alias staging="gcloud container clusters get-credentials conquer-staging --region us-east4 --project dialsource-213300"
alias production='read "brave?Are you sure you want to connect to production? [y/N]"; if [[ "$brave" =~ ^[Yy]$ ]]; then gcloud beta container clusters get-credentials production --region us-east4 --project dialsource-213300; fi'
alias ci='gcloud container clusters get-credentials ci-cd --region us-east4 --project dialsource-213300'

# git
alias gtag='git rev-parse --short=10 HEAD'

# autocomplete for gcloud
# # The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/david/Source/google-cloud-sdk/path.zsh.inc' ]; then . '/home/david/Source/google-cloud-sdk/path.zsh.inc'; fi
#
# # The next line enables shell command completion for gcloud.
if [ -f '/home/david/Source/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/david/Source/google-cloud-sdk/completion.zsh.inc'; fi

bindkey '^R' history-incremental-search-backward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
export PATH=$PATH:/Users/lebsack/.spicetify

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export DOCKER_DEFAULT_PLATFORM=linux/amd64
# # useful only for Mac OS Silicon M1,
# still working but useless for the other platforms
# docker() {
#  if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
#     /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
#   else
#      /usr/local/bin/docker "$@"
#   fi
# }

export PATH=$PATH:/Users/david/.spicetify

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/david/.lmstudio/bin"
