# Set up various symlinks to configuration files in the .home directory

# show a list of all of the make targets
default:
	@echo "Please use one of the following targets for make:"
	@-cat Makefile | egrep '^[^[:space:]]+:' | awk -F: '{print $$1}' | sed 's/^/  /' | grep -v default

all: git vim zshrc workdir

git-personal:
	@echo
	@echo "setting up GIT"
	rm -f ~/.gitconfig
	ln -s $(PWD)/.gitconfig-personal ~/.gitconfig

git-work:
	@echo
	@echo "setting up GIT"
	rm -f ~/.gitconfig
	ln -s $(PWD)/.gitconfig-personal ~/.gitconfig

vim-submodules:
	@echo
	@echo "updating dependencies for VIM"
	@git submodule update --init --recursive

vim: vim-submodules
	@echo
	@echo "setting up VIM"
	rm -f ~/.vimrc ~/.gvimrc 
	rm -f ~/.vim
	ln -s $(PWD)/.vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc 
	ln -s ~/.vim/gvimrc ~/.gvimrc 

workdir:
	@echo
	@echo "setting up the work area"
	mkdir -p ~/work/tmp ~/work/projects 

zshrc:
	@echo
	@echo "setting up ZSH"
	rm -f ~/.zshrc
	ln -s $(PWD)/.zshrcd/zshrc ~/.zshrc

