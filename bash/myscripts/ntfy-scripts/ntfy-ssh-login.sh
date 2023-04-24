#!/bin/bash
# This scripts sends an alert to a ntfy server with the name of the user that logged in via ssh
#
ntfy_url=ntfy.your.domain
ntfy_topic=your_topic

if [ "${PAM_TYPE}" = "open_session" ]; then
  curl \
    -H prio:high \
    -H tags:warning \
    -d "SSH login: ${PAM_USER} from ${PAM_RHOST}" \
    $ntfy_url/$ntfy_topic
fi

# to use make this file executable 
# place this file in  /usr/bin/ and then add the following line to /etc/pam.d/sshd
# session optional pam_exec.so /usr/bin/ntfy-ssh-login.sh