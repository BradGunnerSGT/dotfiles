# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
ZSH_THEME="mortalscumbag"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python ruby sudo zsh-syntax-highlighting)
OSTYPE=`uname -s`
[ "x$OSTYPE" = "xDarwin" ] && plugins+="osx"
#echo -n "Loading oh-my-zsh with plugins: " ; for i in $plugins ; do echo -n "$i " ; done ; echo
source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# export the location of the DOTFILES
export DOTFILES=$HOME/.dotfiles

### fix oh-my-zsh's stupid history default
setopt append_history
unsetopt share_history
set -o vi

# alias to follow a file, e.g. a log file.
# This command follows the file by name, so this will tail even after the log file is rotated
alias follow="less --follow-name +F"

export EDITOR=vi
type -p vim > /dev/null
[ $? = 0 ] && export EDITOR=vim

type -p tmux > /dev/null
if [ $? = 0 ]; then 
  alias tmux="tmux -2" 
  alias tattach="tmux attach || tmux new-session -s default" 
fi

# prepend the pkgsrc path if needed
if [ -d /usr/pkg/bin ]; then
  export PATH=/usr/pkg/bin:/usr/pkg/sbin:$PATH
fi

# set java_home accordingly
if [ -x /usr/libexec/java_home ]; then
  # Mac OS X, use this utility to find system java_home
  export JAVA_HOME=$(/usr/libexec/java_home)
elif [ -h /etc/alternatives/java_sdk ]; then
  # RHEL/Centos
  export JAVA_HOME=/etc/alternatives/java_sdk
fi

# customize per OS type
OSRC=$HOME/.dotfiles/.zshrc.os/`uname -s`
if [ -f $OSRC ]; then
  #print "Loading RC file for" `basename $OSRC` "hosts"
  source $OSRC
fi

# customize per machine
HOSTRC=$HOME/.dotfiles/.zshrc.hosts/$HOST
if [ -f $HOSTRC ]; then
  #print "Loading RC file for" `basename $HOSTRC`
  source $HOSTRC
fi
