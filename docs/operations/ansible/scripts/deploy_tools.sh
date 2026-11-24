#!/bin/bash

export PATH='/sbin:/usr/sbin:/bin:/usr/bin'

export ANSIBLE_CONFIG='/data/ansible/etc/ansible.cfg'

shopt -sq expand_aliases

alias ansible='/data/venv/python310/bin/ansible'

# ----------------------------------------------------------------------

function MAIN {
    HOST=$1
    FILE=$2
    if [ -f /data/temps/tools/${FILE} ]; then
        ansible -m synchronize -a "src=/data/temps/tools/${FILE} dest=/tmp/" ${HOST}
        ansible -m shell -a "tar xf /tmp/${FILE} -C /usr/bin/" ${HOST}
        ansible -m shell -a "rm -f /tmp/${FILE}" ${HOST}
    fi
}

# ----------------------------------------------------------------------

MAIN diycl cos-20220615.el7.tar.gz
MAIN diycl jspctl-20220615.el7.tar.gz
MAIN diycl xftp-20220615.el7.tar.gz

MAIN diyclel6 cos-20220615.el6.tar.gz
MAIN diyclel6 jspctl-20220615.el6.tar.gz
MAIN diyclel6 xftp-20220615.el6.tar.gz
