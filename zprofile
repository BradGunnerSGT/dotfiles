type -p keychain > /dev/null
if [ $? = 0 ]; then
  unset SSH_ASKPASS
  /usr/bin/env keychain --clear $HOME/.ssh/id_rsa
  source $HOME/.keychain/$HOST-sh
fi

