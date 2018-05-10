# zsh-config

# setup oh my zsh
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

or

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

# update config
```
ln -s ~/dotfiles/zshrc ~/.zshrc

ln -s ~/dotfiles/alias/zsh_alias ~/.zsh_alias

ln -s ~/dotfiles/alias/git_alias ~/.git_alias
```


# vim
## Set up Vundle
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Install Plugins
Launch vim and run :PluginInstall
