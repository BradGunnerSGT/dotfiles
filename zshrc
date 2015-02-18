source $HOME/.antigen/antigen/antigen.zsh
# pull in deps from oh-my-zsh for things like the theme, etc
antigen use oh-my-zsh
antigen bundle git
antigen bundle ruby
antigen bundle gem
antigen bundle python
antigen bundle pip
antigen bundle sudo
antigen bundle vi-mode
antigen bundle virtualenv
antigen bundle zsh-users/zsh-syntax-highlighting
# learns recent directories and lets you jump to them quickly
antigen bundle rupa/z

# favorite theme, supports git integration
antigen theme mortalscumbag

# prepend the pkgsrc path if needed
if [ -d /usr/pkg/bin ]; then
  export PATH=/usr/pkg/bin:/usr/pkg/sbin:$PATH
fi

type -p tmux > /dev/null
if [ $? = 0 ]; then 
  antigen bundle tmux
  alias tmux="tmux -2" 
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
type -p vim > /dev/null
[ $? = 0 ] && export EDITOR=vim

# install gems into my home dir, instead of messing with system-wide gems
export GEM_HOME=$HOME/.gems
export PATH=$HOME/.gems/bin:$PATH
export PATH=$HOME/bin:$PATH

### fix oh-my-zsh's stupid history default
#setopt append_history
unsetopt share_history

# final customizations per machine
# TODO move this to an antigen bundle
HOSTRC=$HOME/.dotfiles/.zshrc.hosts/$HOST
if [ -f $HOSTRC ]; then
  print "Loading RC file for" `basename $HOSTRC`
  source $HOSTRC
fi
