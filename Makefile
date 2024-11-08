all: .base_alias .bashrc .dev_alias .export .git_alias .tmux.conf .zsh_alias .zshrc .vimrc

NOW = $(shell date "+%Y%m%d_%H%M%S")

.PHONY: link-user-config
link-user-config:
	@if [ ! -e ~/.base_alias ]; then ln -s ~/workspace/src/dotfiles/alias/base_alias ~/.base_alias; fi
	@if [ ! -e ~/.dev_alias ]; then touch ~/workspace/src/dotfiles/alias/dev_alias && ln -s ~/workspace/src/dotfiles/alias/dev_alias ~/.dev_alias; fi
	@if [ ! -e ~/.git_alias ]; then ln -s ~/workspace/src/dotfiles/alias/git_alias ~/.git_alias; fi
	@if [ ! -e ~/.zsh_alias ]; then ln -s ~/workspace/src/dotfiles/alias/zsh_alias ~/.zsh_alias; fi
	@if [ ! -e ~/.zshrc ]; then ln -s ~/workspace/src/dotfiles/zshrc ~/.zshrc; fi
	@if [ ! -e ~/.vimrc ]; then ln -s ~/workspace/src/dotfiles/vimrc ~/.vimrc; fi

.base_alias:
	ln -s ~/dotfiles/alias/base_alias ~/.base_alias

.bashrc:
	ln -s ~/dotfiles/bashrc ~/.bashrc

.dev_alias:
	ln -s ~/dotfiles/alias/dev_alias ~/.dev_alias

.export:
	ln -s ~/dotfiles/export ~/.export

.git_alias:
	ln -s ~/dotfiles/alias/git_alias ~/.git_alias
	
.tmux.conf:
	ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

.zsh_alias:
	ln -s ~/dotfiles/alias/zsh_alias ~/.zsh_alias

.zshrc:
	ln -s ~/dotfiles/zshrc ~/.zshrc

.vimrc:
	ln -s ~/dotfiles/vimrc ~/.vimrc

.PHONY: backup-user-config
backup-user-config:
	@if [ -f ~/.bash_alias ]; then cp ~/.bash_alias ~/.bash_alias.bak.${NOW} fi
	@if [ -f ~/.dev_alias ]; then cp ~/.dev_alias ~/.dev_alias.bak.${NOW} fi
	@if [ -f ~/.git_alias ]; then cp ~/.git_alias ~/.git_alias.bak.${NOW} fi
	@if [ -f ~/.zsh_alias ]; then cp ~/.zsh_alias ~/.zsh_alias.bak.${NOW} fi
	@if [ -f ~/.zshrc ]; then cp ~/.zshrc ~/.zshrc.bak.${NOW} fi
	@if [ -f ~/.vimrc ]; then cp ~/.vimrc ~/.vimrc.bak.${NOW} fi

.PHONY: clean-user-config
clean-user-config:
	@if [ -e ~/.bash_alias ]; then rm ~/.bash_alias; fi
	@if [ -e ~/.dev_alias ]; then rm ~/.dev_alias; fi
	@if [ -e ~/.git_alias ]; then rm ~/.git_alias; fi
	@if [ -e ~/.zsh_alias ]; then rm ~/.zsh_alias; fi
	@if [ -e ~/.zshrc ]; then rm ~/.zshrc; fi
	@if [ -e ~/.vimrc ]; then rm ~/.vimrc; fi

clean-link:
	[ -L ~/.base_alias ] && rm ~/.base_alias
	[ -L ~/.bashrc ] && rm ~/.bashrc
	[ -L ~/.dev_alias ] && rm ~/.dev_alias
	[ -L ~/.export ] && rm ~/.export
	[ -L ~/.git_alias ] && rm ~/.git_alias
	[ -L ~/.tmux.conf ] && rm ~/.tmux.conf
	[ -L ~/.zsh_alias ] && rm ~/.zsh_alias
	[ -L ~/.zshrc ] && rm ~/.zshrc
	[ -L ~/.vimrc ] && rm ~/.vimrc
