source $HOME/.antigen/antigen/antigen.zsh
antigen bundle git
antigen bundle ruby
antigen bundle gem
antigen bundle python
antigen bundle pip
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle nojhan/liquidprompt

typeset -U path
# prepend the pkgsrc path if needed
path[1,0]=/usr/pkg/bin
path[1,0]=/usr/pkg/sbin
# install gems into my home dir, instead of messing with system-wide gems
export GEM_HOME=$HOME/.gems
path[1,0]=~/.gems/bin
path[1,0]=~/bin
bindkey -v

type -p tmux > /dev/null
if [ $? = 0 ]; then
  antigen bundle tmux 
  alias tmux="tmux -2" ; 
  alias tattach="tmux attach || tmux new-session -s default" 
fi


# OS specific plugins
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

# alias to follow a file, e.g. a log file.
# This command follows the file by name, so this will tail even after the log file is rotated
alias follow="less --follow-name +F"

# set vi as the default editor, unless vim is installed on the path
export EDITOR=vi
type -p vim > /dev/null && export EDITOR=vim

# final customizations per machine
# TODO move this to an antigen bundle
HOSTRC=$HOME/.dotfiles/.zshrc.hosts/$HOST
[ -f $HOSTRC ] && (
  print "Loading RC file for" `basename $HOSTRC`
  source $HOSTRC
)
