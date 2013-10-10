# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :server do |server|
    server.vm.box = "precise64"
    server.vm.network :private_network, :ip => "192.168.50.10"
    server.vm.provision :puppet, :module_path => "modules" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "site.pp"
    end
  end
  config.vm.define :client do |client|
    client.vm.box = "precise64"
    client.vm.network :private_network, :ip => "192.168.50.20"
    client.vm.provision :puppet, :module_path => "modules" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "site.pp"
    end
  end
end
