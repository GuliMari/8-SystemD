# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.boot_timeout = 3000
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
	
  config.vm.define "systemd" do |box|
    box.vm.network "private_network", type: "dhcp"
    box.vm.hostname = "systemd"
  end

  config.vm.provision "file", source: "files", destination: "/home/vagrant/"
  config.vm.provision "watchlog", type: "shell", path: "watchlog-monitor.sh"
  config.vm.provision "spawn-fcgi", type: "shell", path: "spawn-fcgi.sh"
end

