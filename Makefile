# Set up various symlinks to configuration files in the .home directory

# show a list of all of the make targets
default:
	@echo "Please use one of the following targets for make:"
	@-cat Makefile | egrep '^[^[:space:]]+:' | awk -F: '{print $$1}' | sed 's/^/  /'

zshrc:
	rm -f ~/.zshrc
	ln -s ~/.home/.zshrcd/zshrc ~/.zshrc

vim:
	rm -f ~/.vimrc ~/.gvimrc
	ln -s ~/.home/.vim/.vimrc ~/.vimrc 
	ln -s ~/.home/.vim/.gvimrc ~/.gvimrc 

