#!/bin/bash

cat << EOF
{
	"group1": [ "node1.example.com", "node2.example.com" ], 
	"group2": [ "node3.example.com", "node4.example.com" ],
	"mgmt":   [ "ansible.example.com" ],
        "group3": [ "ansible.example.com" ],

	"_meta": {
    		"hostvars": {
        		"node1.example.com": {
                		"ansible_ssh_user": "devops",
                		"ansible_host":  "172.21.81.101"
          		},
        		"node2.example.com": {
                		"ansible_ssh_user": "devops",
                		"ansible_host":  "172.21.81.102"
         		},
        		"node3.example.com": {
                		"ansible_ssh_user": "devops",
             			"ansible_host":  "172.21.81.103"
          		},
        		"node4.example.com": {
                		"ansible_ssh_user": "devops",
                		"ansible_host":  "172.21.81.104"
         		},
        		"ansible.example.com": {
                		"ansible_connection": "local",
          		},
        	}
	}

}

EOF
