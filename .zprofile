
which keychain | grep -v "not found" > /dev/null
if [ $? = 0 ]; then
  /usr/bin/env keychain --clear $HOME/.ssh/id_rsa
  source $HOME/.keychain/$HOST-sh
fi

which tmux 2>&1 > /dev/null
if [ $? ]; then
    print "Available tmux sessions:"
    tmux list-sessions
fi
