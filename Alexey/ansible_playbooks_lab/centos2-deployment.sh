sudo useradd -m ansible
sudo echo Ansible123|passwd --stdin ansible
sudo echo "ansible ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible
mkdir /home/ansible/.ssh
chown ansible:ansible /home/ansible/.ssh
chmod 0700 /home/ansible/.ssh
ssh-keygen -t rsa -f /home/ansible/.ssh/id_rsa -N ""
sudo sed -i.bak -e "s/asswordAuthentication no/asswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd
