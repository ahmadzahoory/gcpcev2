#!/bin/bash
# Deploy Web server
sudo apt-get -y update
sudo apt-get install -y apache2
sudo apt-get install -y unzip
apt-get install -y stress-ng
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get -y update
sudo apt-get install -y php8.3
sudo systemctl restart apache2.service
cd /var/www/html/
sudo rm index.html
sudo wget https://github.com/ahmadzahoory/gcpcev2/raw/main/lab-08-01-code.zip
sudo unzip lab-08-01-code.zip
# Create user and set password
sudo useradd -m -s /bin/bash gcpadmin
sudo usermod -aG sudo gcpadmin
sudo echo "gcpadmin:lab-password" | chpasswd
# Turn on password authentication
sudo sed -i 's|[#]*KbdInteractiveAuthentication no|#KbdInteractiveAuthentication no|g' /etc/ssh/sshd_config
sudo sed -i 's|[#]*#PasswordAuthentication yes|PasswordAuthentication yes|g' /etc/ssh/sshd_config
sudo systemctl restart ssh
