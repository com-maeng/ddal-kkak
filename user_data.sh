#!/bin/bash

### Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

### Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

### Install Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

### Enable SSH password login method
sudo rm /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
sudo bash -c "echo PasswordAuthentication yes > /etc/ssh/sshd_config.d/yeardream.conf"
sudo systemctl restart sshd

### Create users
num_users=11
password_length=20

output_file="/home/ubuntu/user_credentials.csv"
echo "Username,Password" > $output_file

for i in $(seq 0 $((num_users - 1)))
do
    username="user$i"
    password=$(openssl rand -base64 15)
    
    sudo useradd -m -s /bin/bash -G docker -p "$(openssl passwd -6 $password)" "$username"
    
    echo "$username,$password" >> $output_file
done

### Force forwarding to Docker container
sudo tee /home/ubuntu/forward_to_container.sh > /dev/null <<EOF
#!/bin/bash

current_user=\$USER

case "\$current_user" in
  user0)
    docker exec -it cuda-0 /bin/bash
    ;;
  user1)
    docker exec -it cuda-1 /bin/bash
    ;;
  user2)
    docker exec -it cuda-2 /bin/bash
    ;;
  user3)
    docker exec -it cuda-3 /bin/bash
    ;;
  user4)
    docker exec -it cuda-4 /bin/bash
    ;;
  user5)
    docker exec -it cuda-5 /bin/bash
    ;;
  user6)
    docker exec -it cuda-6 /bin/bash
    ;;
  user7)
    docker exec -it cuda-7 /bin/bash
    ;;
  user8)
    docker exec -it cuda-8 /bin/bash
    ;;
  user9)
    docker exec -it cuda-9 /bin/bash
    ;;
  user10)
    docker exec -it cuda-10 /bin/bash
    ;;
  ubuntu)
    exec /bin/bash
    ;;
  *)
    echo "Error: Unknown user"
    exit 1
    ;;
esac

# 컨테이너 exit 후 SSH 세션 종료
exit
EOF

sudo bash -c "cat <<EOF >>/etc/ssh/sshd_config.d/yeardream.conf
ForceCommand /home/ubuntu/forward_to_container.sh
EOF"
