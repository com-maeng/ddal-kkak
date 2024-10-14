#!/bin/bash

sudo rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf  # EC2 default config file
sudo bash -c "echo PasswordAuthentication yes > /etc/ssh/sshd_config.d/ddal-kkak.conf"
