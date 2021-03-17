# Profiler
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export SHELL=$(which zsh)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# https://github.com/caiogondim/bullet-train.zsh/issues/207
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias v="nvim"
alias vim="nvim"

# GIT ALIASES
alias gaa="git add -A"
alias gam="git commit --amend --no-edit"
alias gpod="git pull origin master"
alias gl="git log --graph --oneline"
alias grc="git rebase --continue"
alias gcof="git branch | fzf | xargs git checkout"
alias lg="lazygit"
alias gpom="git push origin master -f"
alias gpum="git pull origin master"

alias fms="foreman start -f Procfile.dev" 

# docker-compose aliases
alias dcup="docker-compose up"
alias dcb="docker-compose build"
alias dcd="docker-compose down"

# Projects
alias ws="cd ~/workspace"
alias cdf="ls -a | fzf | xargs cd"

# Docker machine
alias dm="docker-machine"

# Vagrant
alias vg="vagrant"
alias vgs="vagrant ssh"

# Terraform
alias tf="terraform"

# Kubernetes
alias k="kubectl"
alias kg="kubectl get"
alias kd="kubectl describe"
alias wkp="watch kubectl get pods"
alias ke="kubectl exec -it"

# cht.sh
alias ch="cht.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/namtx/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/namtx/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/namtx/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/namtx/google-cloud-sdk/completion.zsh.inc'; fi

# RVM
# rvm gemset use default

# GO
export GOPATH="/Users/namtx/go"
export PATH="/usr/local/bin:$PATH:$GOPATH/bin"

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# PHP
export PATH="$PATH:/usr/local/php5/bin"

# EDITOR
export EDITOR="nvim"

# GITHUB
export GH_USER="namtx"

# UTILS
mkdircd() {
  mkdir -p ${1} && \
    cd -P -- ${1}
}

# Connect to Airpods
airpod() {
  airpod_address=$(blueutil --paired --format json | jq '.[] | select(.name | contains("Airpods")) | .address' | tr -d '"')

  blueutil --connect $airpod_address
}

wtc() {
  git commit -m "$(curl -s http://whatthecommit.com/index.txt)"
}

# Tmux
export TERM="screen-256color"
alias t="tmux"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# NVM
export NVM_DIR=~/.nvm

source_nvm() {
  source $(brew --prefix nvm)/nvm.sh
}

homestead() {
  cd ~/Homestead && vagrant $*
}

conf() {
  case $1 in
    nvim)
      nvim ~/.config/nvim/init.vim
      ;;
    skhd)
      nvim ~/.config/skhd/skhdrc
      ;;
    kitty)
      nvim ~/.config/kitty/kitty.conf
      ;;
    zsh)
      nvim ~/.zshrc
      ;;
    *)
      nvim $1
      ;;
  esac
}

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.9.1)

# Personio monolith
alias pc=~/Projects/personio/personio/perctl
alias monolog="lnav /Users/namtx/Projects/personio/personio/app/storage-local/logs/laravel.log"
cdp() {
  ls ~/Projects/personio | fzf | read project
  cd "/Users/namtx/Projects/personio/${project}"
}

export GPG_TTY=`tty`

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/namtx/.sdkman"
[[ -s "/Users/namtx/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/namtx/.sdkman/bin/sdkman-init.sh"

# FZF with ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{node_modules,.git,vendor}"'

neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
