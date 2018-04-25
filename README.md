# jokerng
Yet another Docker clone for FreeBSD jails

**Why jokerng?**

I am yet another poor soul doing DevOps with FreeBSD, dreaming that one day we may have tools similar to Docker and Kubernetes.

Many people in the past came with the idea of implementing or porting Docker to FreeBSD, naming it **Jocker**.  Everybody likes the name because it is catchy: the project uses **FreeBSD jails** and the Docker/Container movement in Linux is a "joke" for many FreeBSD supporters :)

**jokerng** will be the best **jocker** implementation ever and it will not be yet another dead repo in github. **I swear**!

Objective
=========

Crafting something that provides the minimum functionalities to run disposable jails in FreeBSD.

The concept and philosophy is similar to Docker but without the fancy stuff. I am busy and terrible at coding, that's why I will use off the shelf tools to build the **Proof of Concept**

Standard FreeBSD packages used:

* Nginx plus pkgng to build a library or catalog.
* zfs snapshots
* ezjail


Setup components
================

* library to deliver ezjail base and jails with pkgng
* ezjail base (used to deliver a common FreeBSD base to all jails) as a pkg
*  **Optional:** /usr/src as a pkg? ezjail can cause problems with freebsd-update otherwise
* jails exported via **zfs snapshot** and packaged with pkgng
* some scripts or ansible to automate the management tasks

Package contents
================

* zfs snapshot
* ezjail config
* ezjail mount point config (for sharing the base plus shared mount points for non-volatile data).
* post install script to load jail (without starting the jail, ez-jail startcrypto is needed to force the start)

Note: The jail doesn't autostart on boot unless we change the config. This must be part of the deployment process when a particular jail is promoted to run live traffic. This way we can have multiple versions for a fast roll back.


PoC
===

* Vagrant imgage for the library
* Vagrant image for the jailhost
* **Packer** and **Ansible** to configure and build the Vagrant images
* Logic to autogenerate the demo packages and the packaged jails distribution.

<a href="https://asciinema.org/a/178282"><img src="https://asciinema.org/a/178282.png" width="836"/></a>

External links
==============
Creating custom packages in FreeBSD http://lastsummer.de/creating-custom-packages-on-freebsd/


