# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  config.vm.box = "bento/debian-9.2"
  #config.vm.box_version = "2017-10-17"
  config.vm.network :forwarded_port, guest: 5432, host: 9500
end
