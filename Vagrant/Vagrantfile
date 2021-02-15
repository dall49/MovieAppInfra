# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "server1" do |server1|
    server1.vm.box = "bento/ubuntu-20.04"
    server1.vm.hostname = "server1"
    server1.vm.network "private_network", ip: "192.168.33.10"
    server1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 1024
      vb.cpus = 1
    end
  end

  config.vm.define "server2" do |server2|
    server2.vm.box = "bento/ubuntu-20.04"
    server2.vm.hostname = "server2"
    server2.vm.network "private_network", ip: "192.168.33.11"
    server2.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 1024
      vb.cpus = 1
    end
  end

  config.vm.define "server3" do |server3|
    server3.vm.box = "bento/ubuntu-20.04"
    server3.vm.hostname = "server3"
    server3.vm.network "private_network", ip: "192.168.33.12"
    server3.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 1024
      vb.cpus = 1
    end
  end

end
