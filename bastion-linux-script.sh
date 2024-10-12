#!/bin/bash
sudo apt-get -y update
sudo useradd -m -s /bin/bash gcpadmin
sudo usermod -aG sudo gcpadmin
sudo echo "gcpadmin:lab-password" | chpasswd
sudo sed -i 's|[#]*KbdInteractiveAuthentication no|#KbdInteractiveAuthentication no|g' /etc/ssh/sshd_config
sudo sed -i 's|[#]*#PasswordAuthentication yes|PasswordAuthentication yes|g' /etc/ssh/sshd_config
sudo systemctl restart ssh
