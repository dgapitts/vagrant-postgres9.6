# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.hostname = "pg96centos7"
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.2.77"
  config.vm.network :forwarded_port, guest: 5432, host: 9500
  config.vm.provision :shell, :path => "provision.sh"
end
