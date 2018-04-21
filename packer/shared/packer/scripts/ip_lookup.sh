#!/bin/sh

ifconfig xn0 | sed -ne 's/.*inet \(.*\) netmask.*/\1/gp' > /tmp/ip
