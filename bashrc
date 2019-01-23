# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# source others
source ~/.base_alias
source ~/.git_alias
source ~/.dev_alias
source ~/.export

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[[ -s /data/home/tiancichen/.autojump/etc/profile.d/autojump.sh ]] && source /data/home/tiancichen/.autojump/etc/profile.d/autojump.sh
