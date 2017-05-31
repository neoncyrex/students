 
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
sudo useradd -m ansibleadmin
sudo echo Ansible123|passwd --stdin ansibleadmin
sudo echo "ansibleadmin ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ansibleadmin
mkdir /home/ansibleadmin/.ssh
chown ansibleadmin:ansibleadmin /home/ansibleadmin/.ssh
chmod 0700 /home/ansibleadmin/.ssh
ssh-keygen -t rsa -f /home/ansibleadmin/.ssh/id_rsa -N ""
cp /vagrant/ansible-configs/ansible.cfg /home/ansibleadmin/
cp /vagrant/ansible-configs/inventory /var/ansible.inventory
sudo chown ansibleadmin:ansibleadmin /home/ansibleadmin/ -R
sudo chmod 0700 /home/ansibleadmin/ -R
sudo su ansibleadmin -c "export ANSIBLE_CONFIG=/home/ansibleadmin/ansible.cfg"

