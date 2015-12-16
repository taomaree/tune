#!/bin/bash

LIMITS_URL=https://raw.githubusercontent.com/taomaree/tune/master/91-limits.conf
SYSCTL_URL=https://raw.githubusercontent.com/taomaree/tune/master/91-sysctl.conf

ulimit -n 65536
test -d /etc/sysctl.d || mkdir -p /etc/sysctl.d/
wget -N ${SYSCTL_URL} -P /etc/sysctl.d/
wget -N ${LIMITS_URL} -P /etc/security/limits.d/
sysctl -f /etc/sysctl.d/91-sysctl.conf

echo "you need reboot system to set ulimit."
