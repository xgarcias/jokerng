#!/bin/sh -e

# Install bash & sudo
pkg install -y bash sudo
echo 'fdescfs		/dev/fd		fdescfs	rw,late	0	0' >> /etc/fstab

# Create the vagrant user with a password of vagrant
pw groupadd vagrant -g 1001
mkdir -p /home/vagrant
pw useradd -n vagrant -u 1001 -c 'Vagrant User' -d /home/vagrant \
	-g 1001 -G 0 -m -M 0755 -w yes -s /usr/local/bin/bash

# Configure sudo to allow the vagrant user
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /usr/local/etc/sudoers.d/vagrant
chmod 0440 /usr/local/etc/sudoers.d/vagrant

# Configure passwordless su to wheel users
sed -i '' '/pam_group.so/ a\
auth		sufficient	pam_group.so		trust use_uid ruser
' /etc/pam.d/su

# Configure the vagrant ssh key
mkdir /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
fetch -am --no-verify-peer -o /home/vagrant/.ssh/authorized_keys "https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub"
chmod 0600 /home/vagrant/.ssh/authorized_keys
cat  /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Synced folders
pkg install -y rsync
echo 'rpcbind_enable="YES"' > /etc/rc.conf.d/rpcbind
echo 'nfs_server_enable="YES"' > /etc/rc.conf.d/nfsd
touch /etc/exports

# Set the build time
date > /etc/vagrant_box_build_time
