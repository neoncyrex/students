#!/bin/bash

ansible allservers -m copy -a "src=/var/www/html/runme.sh dest=/usr/bin/runme.sh mode=0755" -b
ansible allservers -m group -a "name=ansible state=present" -b
ansible allservers -m user -a "name=ansible password='Ansible123' state=present" -b
ansible allservers -m file -a "path=/usr/bin/runme.sh owner=ansible group=ansible" -b
ansible allservers -m command -a "/usr/bin/runme.sh" -b --become-user=ansible

