# Set up various symlinks to configuration files in the .home directory

# show a list of all of the make targets
default:
	@echo "Please use one of the following targets for make:"
	@-cat Makefile | egrep '^[^[:space:]]+:' | awk -F: '{print $$1}' | sed 's/^/  /' | grep -v default

all: git-work tmux vim zshrc workdir

git-personal:
	@echo
	@echo "setting up GIT"
	@rm -f ~/.gitconfig
	@ln -s $(PWD)/.gitconfig-personal ~/.gitconfig

git-work:
	@echo
	@echo "setting up GIT"
	@rm -f ~/.gitconfig
	@ln -s $(PWD)/.gitconfig-personal ~/.gitconfig

oh-my-zsh:
	@[ -d ~/.oh-my-zsh ] || ( \
	    echo "Cloning the oh-my-zsh repository" && \
	    cd $(HOME) && \
	    git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh \
	)

tmux:
	@echo
	@echo "setting up tmux"
	@rm -f ~/.tmux.conf
	@ln -s $(PWD)/.tmux.conf ~/.tmux.conf

vim-submodules:
	@echo
	@echo "updating dependencies for VIM"
	@git submodule sync
	@git submodule update --init --recursive

vim: vim-submodules
	@echo
	@echo "setting up VIM"
	@rm -f ~/.vimrc ~/.gvimrc 
	@rm -f ~/.vim
	@ln -s $(PWD)/.vim ~/.vim
	@ln -s ~/.vim/vimrc ~/.vimrc 
	@ln -s ~/.vim/gvimrc ~/.gvimrc 
	@mkdir -p $(HOME)/.tmp/vim

workdir:
	@echo
	@echo "setting up the work area"
	@mkdir -p ~/work/tmp ~/work/projects 

zshrc: oh-my-zsh
	@echo "setting up ZSH"
	@rm -f ~/.zshrc
	@ln -s $(PWD)/.zshrc ~/.zshrc
	@rm -f ~/.zprofile
	@ln -s $(PWD)/.zprofile ~/.zprofile

