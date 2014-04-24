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

vim:
	@echo
	@echo "setting up VIM"
	rm -fr ~/.vimrc ~/.gvimrc ~/.vim
	ln -s $(PWD)/.vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc 
	ln -s ~/.vim/gvimrc ~/.gvimrc 


zshrc:
	@echo
	@echo "setting up ZSH"
	rm -f ~/.zshrc
	ln -s $(PWD)/.zshrcd/zshrc ~/.zshrc


workdir:
	@echo
	@echo "setting up the work area"
	mkdir -p ~/work/tmp ~/work/projects 
