#!/bin/bash
useradd ansible -m
echo "Ansible123" | passwd "ansible" --stdin
cd /home/ansibleadmin
ansible all -m ping
ansible -m copy -a "src=/home/vagrant/runme.sh dest=/usr/bin/runme.sh" all -b
ansible all -m file -a "dest=/usr/bin/runme.sh mode=0755 owner=ansible group=ansible" -b
ansible all -a "/usr/bin/runme.sh" -u ansible
