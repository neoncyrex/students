#!/bin/bash

ansible centosservers -m user -a "name=ansible" -b
ansible centosservers -m copy -a "src=/home/vagrant/runme.sh dest=/usr/bin/runme.sh" -b
ansible centosservers -m file -a "path=/usr/bin/runme.sh mode=0755" -b 
ansible centosservers -m file -a "path=/usr/bin/runme.sh owner=ansible group=ansible" -b
ansible centosservers -m command -a "/usr/bin/runme.sh" -b --become-user=ansible