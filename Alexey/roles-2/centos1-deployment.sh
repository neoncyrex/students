sudo useradd -m mgmt
sudo echo Ansible123|passwd --stdin mgmt
sudo echo "mgmt ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/mgmt
sudo sed -i.bak -e "s/asswordAuthentication no/asswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd

