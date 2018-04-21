#!/bin/sh -e

sysrc pf_enable="YES"
service pf start
