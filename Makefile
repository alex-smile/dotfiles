all: .base_alias .bashrc .dev_alias .export .git_alias .tmux.conf .zsh_alias .zshrc .vimrc

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

clear:
	[ -L ~/.base_alias ] && rm ~/.base_alias
	[ -L ~/.bashrc ] && rm ~/.bashrc
	[ -L ~/.dev_alias ] && rm ~/.dev_alias
	[ -L ~/.export ] && rm ~/.export
	[ -L ~/.git_alias ] && rm ~/.git_alias
	[ -L ~/.tmux.conf ] && rm ~/.tmux.conf
	[ -L ~/.zsh_alias ] && rm ~/.zsh_alias
	[ -L ~/.zshrc ] && rm ~/.zshrc
	[ -L ~/.vimrc ] && rm ~/.vimrc
