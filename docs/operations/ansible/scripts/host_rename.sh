#!/bin/bash

export PATH='/sbin:/usr/sbin:/bin:/usr/bin'

cd $(dirname $0)

tee hosts >/dev/null <<EOF
10.26.20.165
10.26.20.166
10.26.20.167
10.26.20.168
10.26.20.169
10.26.20.170
EOF

for i in $(cat hosts); do xsh $i "hostnamectl set-hostname ypzw-$(echo $i | cut -d '.' -f 3,4 | sed 's/\./-/g').server.com"; done
