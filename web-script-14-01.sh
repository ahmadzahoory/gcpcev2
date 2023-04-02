#!/bin/bash
apt-get -y update
apt-get install -y apache2
apt-get install -y unzip
systemctl restart apache2.service
cd /var/www/html/ 
rm index.html
wget https://github.com/ahmadzahoory/gcpcev2/raw/main/lab-12-01-code.zip
unzip lab-12-01-code.zip
useradd -m -s /bin/bash gcpadmin
usermod -aG sudo gcpadmin
echo "gcpadmin:lab-password" | chpasswd
sed -i 's|[#]*PasswordAuthentication no|PasswordAuthentication yes|g' /etc/ssh/sshd_config
systemctl restart sshd.service
