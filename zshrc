source $HOME/.dotfiles/antigen/antigen.zsh
antigen bundle git
antigen bundle ruby
antigen bundle gem
antigen bundle python
antigen bundle pip
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src 
antigen bundle nojhan/liquidprompt

#### Add appropriate locations to the PATH

# Make sure that the $PATH contains only unique items. This prevents further
# loading of .zshrc (for example from within tmux/screen) from prepending the
# same locations over and over and having a super long $PATH.
typeset -U path
# prepend the pkgsrc paths 
#path=(/usr/pkg/bin $path)
#path=(/usr/pkg/sbin $path)
# install gems into my home dir, instead of messing with system-wide gems
export GEM_HOME=$HOME/.gems
path=(~/.gems/bin $path)
path=(~/bin $path)

#### Tmux-specific commands
type -p tmux > /dev/null
if [ $? = 0 ]; then
  antigen bundle tmux 
  alias tmux="tmux -2" ; 
  alias tattach="tmux attach || tmux new-session -s default" 
fi


#### OS specific settings
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle osx
    export JAVA_HOME=$(/usr/libexec/java_home)
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...
    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
	export JAVA_HOME=/etc/alternatives/java_sdk
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

#### ZSH customizations/aliases

# alias to follow a file, e.g. a log file.
# This command follows the file by name, so this will tail even after the log file is rotated
alias follow="less --follow-name +F"

# set the default editor to VIM, fallback to VI if VIM isn't installed
export EDITOR=vi
type -p vim > /dev/null && export EDITOR=vim

# set VI mode for the command line
bindkey -v


#### Final customizations per machine

# TODO move this to an antigen bundle
HOSTRC=$HOME/.dotfiles/.zshrc.hosts/$HOST
[ -f $HOSTRC ] && (
  print "Loading RC file for" `basename $HOSTRC`
  source $HOSTRC
)
