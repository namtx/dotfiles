# Profiler
# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
# DISABLE_AUTO_TITLE="true"

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
alias vim="nvim"
alias v="nvim ."
alias gaa="git add -A"
alias gam="git commit --amend --no-edit"
alias wtc="git commit -m '$(curl -s http://whatthecommit.com/index.txt)'"
alias gpod="git pull origin develop"
alias gl="git log --graph --oneline"
alias grc="git rebase --continue"
# alias grcd="cd $(git rev-parse --show-toplevel)"
# alias gpush="git push origin $(git symbolic-ref --short HEAD)"
# alias grmu="git for-each-ref --sort=-committerdate --count=10 refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias fms="foreman start -f Procfile.dev" 
alias rs="bundle exec rails s"

# docker-compose aliases
alias dcup="docker-compose up"
alias dcb="docker-compose build"
alias dcd="docker-compose down"

# Projects
alias web="cd ~/workspace/the1-web"
alias api="cd ~/workspace/the1-api"
alias leetcode="cd ~/workspace/leetcode"
alias fpx="cd ~/workspace/omise/a/backend-fpx"
alias ws="cd ~/workspace"

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

# EDITOR
export EDITOR="nvim"

# GITHUB
export GH_USER="namtx"

gdiff() {
  git diff -w --word-diff=color ${1:-develop}
}

gbc() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $@..$(git rev-parse --abbrev-ref HEAD)
}

gbbc() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $(git rev-parse --abbrev-ref HEAD)..$@
}

# Utils
mkdircd() {
  mkdir -p ${1} && \
    cd -P -- ${1}
}

# Tmux
export TERM="xterm-256color"
alias t="tmux"

# mupdf
mupdf() {
	mupdf-gl $1 >/dev/null 2>&1 &
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# NVM
export NVM_DIR=~/.nvm

source_nvm() {
  source $(brew --prefix nvm)/nvm.sh
}

export NOTE_SOURCE="$HOME/workspace/namtx.dev/thinkspace/_posts/2020-10-21-daily-notes.md"
note() {
  echo "${date}" >> "$NOTE_SOURCE" && nvim $NOTE_SOURCE
}


# ZSH Profiler
# zprof

# Project
alias pc=~/Projects/personio/personio/perctl
alias phpunit=~/Projects/personio/personio/vendor/phpunit/phpunit/phpunit
export GPG_TTY=`tty`
