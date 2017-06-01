echo script start
sudo yum install epel-release -y
echo start ansible installation
sudo yum install ansible -y && echo ansible is installed, installing git...
sudo yum install git -y && echo git installed, creating final stuff
sudo useradd -m ansible
sudo echo Ansible123|passwd --stdin ansible
sudo echo "ansible ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansible
mkdir /home/ansible/.ssh
chown ansible:ansible /home/devops/.ssh
chmod 0700 /home/ansible/.ssh
ssh-keygen -t rsa -f /home/ansible/.ssh/id_rsa -N ""
sudo sed -i.bak -e "s/asswordAuthentication no/asswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd
mkdir /home/vagrant/files
cp /vagrant/ansible.cfg /home/vagrant/ansible.cfg
cp /vagrant/inventory /home/vagrant/inventory
cp /vagrant/files/index.html /home/vagrant/files/index.html
cp /vagrant/files/httpd.yml /home/vagrant/files/httpd.yml
