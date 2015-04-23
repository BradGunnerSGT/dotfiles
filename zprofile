type -p keychain > /dev/null
HAS_KEYCHAIN=$?
[ -f $HOME/.ssh/id_rsa ] && if [ $HAS_KEYCHAIN = 0 ]; then
  unset SSH_ASKPASS
  /usr/bin/env keychain --clear $HOME/.ssh/id_rsa
  source $HOME/.keychain/$HOST-sh
fi

