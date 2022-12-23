#!/bin/bash
# Deploy webapp code 
sudo apt-get -y update
sudo apt-get install -y apache2
sudo apt-get install -y unzip
sudo systemctl restart apache2.service
cd /var/www/html/
sudo rm index.html
sudo wget https://github.com/ahmadzahoory/gcpcev2/raw/main/lab-09-01-code-b.zip
sudo unzip lab-09-01-code-b.zip
# Create user and set password
useradd -m -s /bin/bash gcpadmin
usermod -aG sudo gcpadmin
echo "gcpadmin:lab-password" | chpasswd
# Turn on password authentication
sed -i 's|[#]*PasswordAuthentication no|PasswordAuthentication yes|g' /etc/ssh/sshd_config
systemctl restart sshd.service
