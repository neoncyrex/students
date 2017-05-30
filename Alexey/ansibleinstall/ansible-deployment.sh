
echo script start
sudo yum install epel-release -y
echo start ansible installation
sudo yum install ansible -y && echo ansible is installed, installing git...
sudo yum install git -y && echo git installed, creating final stuff
cd ~
mkdir ./git
cd ./git
git init
git clone https://github.com/neoncyrex/students.git
echo adding users
sudo useradd -m devops
sudo echo Ansible123|passwd --stdin devops
sudo echo "devops ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/devops
sudo useradd -m mgmt
sudo echo Ansible123|passwd --stdin mgmt
sudo echo "mgmt ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/devops
mkdir /home/devops/.ssh
chown devops:devops /home/devops/.ssh
chmod 0700 /home/devops/.ssh
ssh-keygen -t rsa -f /home/devops/.ssh/id_rsa -N ""
mkdir /home/devops/ansible
mkdir /home/devops/ansible/inventory
cp /vagrant/ansible-configs/ansible.cfg /home/devops/ansible
cp /vagrant/ansible-configs/inventory /home/devops/ansible/inventory/inventory
sudo chown devops:devops /home/devops/ -R
sudo chmod 0700 /home/devops/ -R
sudo su devops -c "export ANSIBLE_CONFIG=/home/devops/ansible/ansible.cfg"
sudo sed -i.bak -e "s/asswordAuthentication no/asswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd

