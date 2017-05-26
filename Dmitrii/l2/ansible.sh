!#/bin/bash
sudo yum install epel-release -y
sudo yum install ansible -y
sudo yum install git -y
cd ~
mkdir ./git
cd ./git
git init
git clone https://github.com/neoncyrex/students.git
