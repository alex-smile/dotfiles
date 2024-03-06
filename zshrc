# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# ============================================

# plugins https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
# plugins=(history colored-man redis-cli autojump gem  cp bundler docker extract encode64 urltools wd httpie npm rails web-search pip python virtualenv supervisor virtualenvwrapper celery pyenv django ruby rbenv go zsh-256color zsh-syntax-highlighting zsh-autosuggestions history-substring-search zsh-completions svn git gitfast git-extras gitignore command-not-found sublime tmux tmuxinator brew osx dirhistory)
plugins=(history autojump cp pip python virtualenv supervisor celery django git gitfast git-extras gitignore command-not-found history-substring-search dirhistory)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# Preferred editor for local and remote sessions
export EDITOR='vim'
export PAGER=cat
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source others
source ~/.base_alias
source ~/.zsh_alias
source ~/.git_alias
source ~/.dev_alias

# diy config

# history
export HISTTIMEFORMAT='%F %T '  # format date+command
export HISTSIZE=20000
export HISTFILESIZE=20000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups 
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTIGNORE="ls:ll:pwd:clear;ll"

export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync

# auto update
DISABLE_UPDATE_PROMPT="true"

# ignore some files
fignore+=(.pyc)

# close error correct
unsetopt correct_all

# path
# export PATH=$PATH
# export PYTHONPATH=$PYTHONPATH

# open alias
alias -s css=vim
alias -s txt=vim
alias -s js=vim

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'


#====================== zsh plugin install begin ========================

#====================== zsh plugin install end ==========================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"

# node10
export PATH="/data/service/node-v10/bin:$PYENV_ROOT/bin:$PATH"
export LDFLAGS="-L/data/service/node-v10/lib"
export CPPFLAGS="-I/data/service/node-v10/include"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# direnv
eval "$(direnv hook zsh)"

# set proxy
#export http_proxy=http://127.0.0.1:12759
#export https_proxy=http://127.0.0.1:12759
export no_proxy=127.0.0.1,localhost

export PATH="$PATH:$HOME/.ft:/data/service/nginx/sbin/"
export PATH="$PATH:/data/service/go/bin:/root/go/bin:/usr/share/logstash/bin/:/usr/share/filebeat/bin/"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
export GPG_TTY=$(tty)

export PYTHON_HOME=/data/service/python-3.7.4
export VIRTUALENVWRAPPER_PYTHON=$PYTHON_HOME/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$PYTHON_HOME/bin/virtualenv

if [ -f $PYTHON_HOME/bin/virtualenvwrapper.sh ]; then
        . $PYTHON_HOME/bin/virtualenvwrapper.sh
fi

[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh

# autoload -U compinit && compinit -u

export PATH="$HOME/.poetry/bin:$PATH"

source <(kubectl completion zsh)
source <(flux completion zsh)
source <(kubectl-argo-rollouts completion zsh)
export PATH=/data/service/preci//PreCI:$PATH
