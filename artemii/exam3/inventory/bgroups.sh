#!/bin/bash

cat  <<EOF
{
	"ansible": {
		"vars": { },
		"children": [ "mgmt" ]
        }
}
EOF
