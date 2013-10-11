# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :server do |server|
    server.vm.box = "precise64"
    server.vm.host_name = "server"
    server.vm.network :private_network, :ip => "192.168.50.10"
    server.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file  = "site.pp"
    end
  end
  config.vm.define :client do |client|
    client.vm.box = "precise64"
    client.vm.host_name = "client"
    client.vm.network :private_network, :ip => "192.168.50.20"
    client.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.module_path = "modules"
      puppet.manifest_file  = "site.pp"
    end
  end
end
