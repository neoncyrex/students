#!/bin/bash

sudo su ansibleadmin -c "export ANSIBLE_CONFIG=/home/ansibleadmin/ansible.cfg"
sudo su ansibleadmin -c "ansible centosservers -m user -a "name=ansible password=Ansible123 state=absent" -b"
sudo su ansibleadmin -c "ansible centosservers -m copy -a "src=/home/vagrant/runme.sh dest=/usr/bin/runme.sh" -b"
sudo su ansibleadmin -c "ansible centosservers -m file -a "path=/usr/bin/runme.sh mode=0755" -b"
sudo su ansibleadmin -c "ansible centosservers -m file -a "path=/usr/bin/runme.sh owner=ansible group=ansible" -b "
sudo su ansibleadmin -c "ansible centosservers -m file -a "path=/usr/bin/adhoc.sh mode=0755" -b"
sudo su ansibleadmin -c "ansible centosservers -m command -a "/usr/bin/runme.sh" -b --become-user=ansible"
