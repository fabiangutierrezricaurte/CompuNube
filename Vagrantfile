# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.define :server20 do |server20_config|
      server20_config.vm.provider :virtualbox do |vb_config|
          vb_config.name = "server20"
      end
      server20_config.vm.hostname = "server20"
      server20_config.vm.network "private_network", ip: "192.162.100.20"
      server20_config.vm.provision :shell, path: "web1.sh"
  end

  config.vm.define :server21 do |server21_config|
      server21_config.vm.provider :virtualbox do |vb_config|
          vb_config.name = "server21"
      end
      server21_config.vm.hostname = "server21"
      server21_config.vm.network "private_network", ip: "192.162.100.21"
      server21_config.vm.provision :shell, path: "web2.sh"
  end

  config.vm.define :haproxyy do |haproxyy_config|
      haproxyy_config.vm.provider :virtualbox do |vb_config|
          vb_config.name = "haproxyy"
      end
      haproxyy_config.vm.hostname = "haproxyy"
      haproxyy_config.vm.network :forwarded_port, guest: 80, host: 8080
      haproxyy_config.vm.network "private_network", ip: "192.162.100.22"
      haproxyy_config.vm.provision :shell, path: "haproxyy.sh"
  end
end
