#####################################################################################
### The --clear option make sure Intruder cannot use your existing SSH-Agents keys 
### i.e. Only allow cron jobs to use password less login 
#####################################################################################
/usr/bin/keychain --clear $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOST-sh

which tmux 2>&1 > /dev/null
if [ $? ]; then
    print "Available tmux sessions:"
    tmux list-sessions
fi
