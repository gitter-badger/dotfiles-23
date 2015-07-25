# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4091
    v.cpus = 4
  end
 
 
  config.vm.provision "shell", inline: <<-SCRIPT
    su vagrant
    cd /vagrant/
    sudo -u vagrant -H './setup.sh'
  SCRIPT

end
