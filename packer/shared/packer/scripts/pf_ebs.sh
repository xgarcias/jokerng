#!/bin/sh -e

cp /tmp/pf.conf /etc/pf.conf
sysrc pf_enable="YES"
service pf start
