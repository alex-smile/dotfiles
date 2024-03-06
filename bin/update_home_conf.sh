#!/bin/bash

BASE_CONF_DIR=~/nginx_conf
TODAY=`(date +%Y%m%d)`


if [ ! -e ~/.gitconfig  ]; then
    ln -s ${BASE_CONF_DIR}/home_conf/gitconfig ~/.gitconfig
fi


if [ ! -e ~/.config ]; then
    ln -s ${BASE_CONF_DIR}/home_conf/config ~/.config
fi


if [ ! -e ~/.pypirc ]; then
    ln -s ${BASE_CONF_DIR}/home_conf/pypirc ~/.pypirc
fi


if [ -e ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.${TODAY}
fi
if [ ! -e ~/.vimrc ]; then
    ln -s ${BASE_CONF_DIR}/home_conf/vim-config/vimrc ~/.vimrc
fi


if [ -e ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.${TODAY}
fi
if [ ! -e ~/.zshrc ]; then
    ln -s ${BASE_CONF_DIR}/home_conf/zsh-config/zshrc ~/.zshrc
fi
if [ ! -e ~/.zsh_alias ]; then
    ln -s ${BASE_CONF_DIR}/home_conf/zsh-config/alias/zsh_alias ~/.zsh_alias
fi
if [ ! -e ~/.git_alias ]; then
    ln -s ${BASE_CONF_DIR}/home_conf/zsh-config/alias/git_alias ~/.git_alias
fi
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
