#!/bin/bash

NUM_USERS=10
OUTPUT_FILE="/usr/local/ddal-kkak/user_credentials.csv"

echo "Username,Password" > $OUTPUT_FILE  # CSV header

for i in $(seq 0 $((NUM_USERS - 1)))
do
    username="user-$i"
    password=$(openssl rand -base64 15)
    
    sudo useradd -m -s /bin/bash -G docker -p "$(openssl passwd -6 $password)" "$username"
    
    echo "$username,$password" >> $OUTPUT_FILE
done
