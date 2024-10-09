#!/bin/bash
sudo apt-get -y update
sudo apt-get install -y apache2
sudo apt-get install -y unzip
sudo apt-get install -y stress-ng
sudo apt-get install -y php7.4
sudo systemctl restart apache2.service
cd /var/www/html/ 
sudo rm index.html
sudo wget https://github.com/ahmadzahoory/gcpcev2/raw/main/lab-08-01-code.zip
sudo unzip lab-08-01-code.zip
sudo useradd -m -s /bin/bash gcpadmin
sudo usermod -aG sudo gcpadmin
sudo echo "gcpadmin:lab-password" | chpasswd
sudo sed -i 's|[#]*KbdInteractiveAuthentication no|#KbdInteractiveAuthentication no|g' /etc/ssh/sshd_config
sudo sed -i 's|[#]*#PasswordAuthentication yes|PasswordAuthentication yes|g' /etc/ssh/sshd_config
sudo systemctl restart ssh
