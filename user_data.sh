#!/bin/bash

DDAL_KKAL_HOME="/usr/local/ddal-kkak"

sudo git clone https://github.com/com-maeng/ddal-kkak $DDAL_KKAL_HOME

sudo bash $DDAL_KKAL_HOME/os/create_users.sh

sudo bash $DDAL_KKAL_HOME/ssh/enable_passwd_auth.sh
sudo bash $DDAL_KKAL_HOME/ssh/enable_force_command.sh
sudo systemctl restart sshd

sudo bash $DDAL_KKAL_HOME/docker/install_docker.sh
sudo bash $DDAL_KKAL_HOME/docker/run_containers.sh
