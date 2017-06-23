sudo useradd -m exam
sudo echo Ansible123|passwd --stdin exam
sudo echo "exam ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/exam
sudo useradd -m deployer
sudo echo Ansible123|passwd --stdin deployer
sudo echo "deployer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/deployer
mkdir /home/exam/.ssh
chown exam:exam /home/exam/.ssh
chmod 0775 /home/exam/.ssh
ssh-keygen -t rsa -f /home/exam/.ssh/id_rsa -N ""
mkdir /home/deployer/.ssh
chown deployer:deployer /home/deployer/.ssh
chmod 0770 /home/deployer/.ssh
ssh-keygen -t rsa -f /home/deployer/.ssh/id_rsa -N ""
cat /home/deployer/.ssh/id_rsa.pub > /home/deployer/.ssh/authorized_keys
chown deployer:deployer /home/deployer/ -R
chmod 0755 /home/deployer/ -R
sudo sed -i.bak -e "s/asswordAuthentication no/asswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo setenforce 0
