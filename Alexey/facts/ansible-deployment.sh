
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
sudo echo "mgmt ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/mgmt
mkdir /home/devops/.ssh
ssh-keygen -t rsa -f /home/devops/.ssh/id_rsa -N ""
mkdir /home/devops/ansible
sudo cp -R /vagrant/ansible-configs/ /home/devops/ansible/
sudo chown devops:devops /home/devops/ -R
sudo chmod 0700 /home/devops/ -R
sudo su devops -c "export ANSIBLE_CONFIG=/home/devops/ansible/ansible.cfg"
sudo sed -i.bak -e "s/asswordAuthentication no/asswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo chown devops:devops /home/devops/
sudo chmod 0700 /home/devops/
