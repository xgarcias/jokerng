#!/bin/sh -e

sysrc cloned_interfaces+=" lo1"
sysrc ifconfig_lo1="up"
sysrc ifconfig_lo1="fib 15 172.31.255.200/24 group natted description 'natted jails'"
sysrc ifconfig_lo1_aliases="inet 172.31.255.201-206/32"
ifconfig lo1 create
