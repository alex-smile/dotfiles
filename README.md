# zsh
- [安装和使用Oh-My-Zsh](https://github.com/zeus911/blog-3/blob/master/others/install-and-use-oh-my-zsh.md)

查看当前所使用的 SHELL
```shell
echo $SHELL
```

查看当前环境下所有支持的SHELL
```shell
cat /etc/shells
```

安装zsh，Ubuntu 下的安装
```shell
apt-get -y install zsh git
```

切换到 zsh 并检查
```shell
chsh -s `which zsh` root # 为root用户修改默认shell为zsh

chsh -s `which zsh` # 为当前用户修改默认shell为zsh，注意：MacOSX系统使用`chsh -s /bin/zsh`即可。

chsh -s /bin/bash # 恢复bash命令
```

安装 Oh-My-Zsh，如果访问 raw.github.com/raw.githubusercontent.com 失败，可配置 hosts，如："185.199.111.133  raw.githubusercontent.com"
```shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

or

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

# update config
```shell
make backup-user-config
make clean-user-config
make link-user-config
```

# vim

## Set up Vundle
```shell
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Install Plugins

Launch vim and run :PluginInstall
