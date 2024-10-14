#!/bin/bash

sudo bash -c "cat <<EOF >>/etc/ssh/sshd_config.d/ddal-kkak.conf
ForceCommand /usr/local/ddal-kkak/os/forward_to_container.sh
EOF"
