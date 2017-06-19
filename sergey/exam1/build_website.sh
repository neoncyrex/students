#! /bin/bash
if [ -d ~/tmp/sergey ]; then
 echo "folder ~/tmp/sergey exists, please remove it to continue"
else
 mkdir -p ~/tmp/sergey
 git clone https://github.com/lameika/exam1.git ~/tmp/sergey
 cd ~/tmp/sergey
 vagrant up
 ansible-playbook run_website.yml
fi
