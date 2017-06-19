
echo script start
sudo yum install epel-release -y
echo start ansible installation
sudo yum install ansible -y && echo ansible is installed, installing git...
sudo yum install git -y && echo git installed, creating final stuff
cd ~
echo adding users
sudo useradd -m exam
sudo echo Ansible123|passwd --stdin exam
sudo echo "exam ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/exam
sudo useradd -m deployer
sudo echo Ansible123|passwd --stdin deployer
sudo echo "deployer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/deployer
mkdir /home/exam/.ssh
chown exam:exam /home/exam/.ssh
chmod 0770 /home/exam/.ssh
ssh-keygen -t rsa -f /home/exam/.ssh/id_rsa -N ""
mkdir /home/deployer/.ssh
chown deployer:deployer /home/deployer/.ssh
chmod 0770 /home/deployer/.ssh
ssh-keygen -t rsa -f /home/deployer/.ssh/id_rsa -N ""
cp -r /vagrant/ansible-configs/ /home/deployer/
sudo chown deployer:deployer /home/deployer/ -R
sudo chmod 0755 /home/deployer/ -R
chmod 0600 /home/deployer/.ssh/id_rsa
sudo sshpass -p Ansible123 ssh-copy-id -i /home/deployer/.ssh/id_rsa.pub deployer@10.0.0.11 "-oStrictHostKeyChecking=no"
sudo sshpass -p Ansible123 ssh-copy-id -i /home/deployer/.ssh/id_rsa.pub deployer@10.0.0.12 "-oStrictHostKeyChecking=no"
sudo sshpass -p Ansible123 ssh-copy-id -i /home/deployer/.ssh/id_rsa.pub deployer@10.0.0.13 "-oStrictHostKeyChecking=no"
sudo sed -i.bak -e "s/asswordAuthentication no/asswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd

