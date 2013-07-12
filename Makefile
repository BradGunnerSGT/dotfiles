# Set up various symlinks to configuration files in the .home directory

# show a list of all of the make targets
default:
	@echo "Please use one of the following targets for make:"
	@-cat Makefile | egrep '^[^[:space:]]+:' | awk -F: '{print $$1}' | sed 's/^/  /' | grep -v default

all: git vim zshrc workdir


git:
	@echo
	@echo "setting up GIT"
	rm -f ~/.gitconfig
	ln -s ~/.home/.gitconfig ~/.gitconfig

vim:
	@echo
	@echo "setting up VIM"
	rm -fr ~/.vimrc ~/.gvimrc ~/.vim
	ln -s ~/.home/.vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc 
	ln -s ~/.vim/gvimrc ~/.gvimrc 


zshrc:
	@echo
	@echo "setting up ZSH"
	rm -f ~/.zshrc
	ln -s ~/.home/.zshrcd/zshrc ~/.zshrc


workdir:
	@echo
	@echo "setting up the work area"
	mkdir -p ~/work/tmp ~/work/projects 
