useradd -m -s /bin/bash gcpadmin
usermod -aG sudo gcpadmin
echo "gcpadmin:lab-password" | chpasswd
sed -i 's|[#]*PasswordAuthentication no|PasswordAuthentication yes|g' /etc/ssh/sshd_config
systemctl restart sshd.service
