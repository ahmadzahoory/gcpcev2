usermod -aG sudo gcpadmin
echo "gcpadmin:lab-password" | chpasswd
sed -i 's|[#]*KbdInteractiveAuthentication no|#KbdInteractiveAuthentication no|g' /etc/ssh/sshd_config
sed -i 's|[#]*#PasswordAuthentication yes|PasswordAuthentication yes|g' /etc/ssh/sshd_config
systemctl restart ssh
