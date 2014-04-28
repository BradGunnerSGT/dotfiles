
type -p keychain > /dev/null
if [ $? = 0 ]; then
  /usr/bin/env keychain --clear $HOME/.ssh/id_rsa
  source $HOME/.keychain/$HOST-sh
fi

type -p tmux > /dev/null 
if [ $? = 0 ]; then
    print "Available tmux sessions:"
    tmux list-sessions 2> /dev/null || print "None"
    print
fi
