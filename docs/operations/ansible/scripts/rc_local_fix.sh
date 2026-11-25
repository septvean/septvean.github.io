#!/bin/bash
mv /etc/rc.local /data/temps/
cd /etc
ln -svf rc.d/rc.local .
chown root:root /etc/rc.d/rc.local
chmod 755 /etc/rc.d/rc.local
