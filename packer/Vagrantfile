# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(2) do |config|
   config.vm.provision "shell", inline: "sudo zfs set readonly=off zroot/ROOT/default"

    config.vm.define "library" do |library|
        library.vm.box ="/tmp/builds/111amd-jokerng-library.box"
        library.vm.network "private_network", ip: "192.168.50.2"
        library.vm.provision "shell", inline: "sudo sysrc ifconfig_vtnet1='inet 192.168.50.2/24' && sudo ifconfig vtnet1 inet 192.168.50.2/24"
    end

    config.vm.define "jailhost" do |jailhost|
        jailhost.vm.box ="/tmp/builds/111amd-jokerng-jailhost.box"
        jailhost.vm.network "private_network", ip: "192.168.50.3"
        jailhost.vm.provision "shell", inline: "sudo sysrc ifconfig_vtnet1='inet 192.168.50.3/24' && sudo ifconfig vtnet1 inet 192.168.50.3/24"
    end

end
