# -*- mode: ruby -*-
# vim: set filetype=ruby :
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = 2

BOX = "debian/jessie64"

servers = [
  ["gluster-0", 1, 1024, "192.168.1.70"],
  ["gluster-1", 1, 1024, "192.168.1.71"]
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |c|
  c.vm.boot_timeout = 60
  c.vm.box = BOX

  servers.each do |s|
    name, cpus, memory, ip = s

    c.vm.define name do |n|
      n.vm.box_check_update = false

      n.vm.hostname = name
      n.vm.network "private_network", ip: ip

      n.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.cpus = cpus
        vb.memory = memory

        vb.customize "pre-boot", ['modifyvm', :id, '--nestedpaging', 'off']
      end

      n.vm.provision "shell", path: "setup.sh"
    end
  end
end

# http://gluster.readthedocs.org/en/latest/Quick-Start-Guide/Quickstart/

# example /etc/hosts
#
# # gluster-0
# 127.0.0.1    gluster-0
# 192.168.1.71 gluster-1
#
# # gluster-1
# 127.0.0.1    gluster-1
# 192.168.1.70 gluster-0

