#!/bin/bash

export PATH='/sbin:/usr/sbin:/bin:/usr/bin'

IP=${1:-127.0.0.1}

crontab -u root -l > /tmp/root.cron

tee -a /tmp/root.cron >/dev/null <<EOF
* * * * * /bin/bash /data/scripts/cos/kube_proxy.sh ${IP} >/dev/null 2>&1
* * * * * /bin/bash /data/scripts/cos/kubelet.sh ${IP} >/dev/null 2>&1
EOF

crontab -u root /tmp/root.cron
