source $HOME/.antigen/antigen/antigen.zsh
# pull in deps from oh-my-zsh for things like the theme, etc
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle ruby
antigen bundle gem
antigen bundle python
antigen bundle pip
antigen bundle virtualenv
# learns recent directories and lets you jump to them quickly
antigen bundle rupa/z

# favorite theme, supports git integration
antigen theme mortalscumbag

export PATH=/usr/pkg/bin:$PATH
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

#antigen bundle ssh-agent

export GEM_HOME=$HOME/.gems
export PATH=$HOME/.gems/bin:$PATH
export PATH=$HOME/bin:$PATH
