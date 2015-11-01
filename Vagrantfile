
GLUSTERFS = "http://download.gluster.org/pub/gluster/glusterfs/3.7/3.7.5/Debian/jessie"

$script = <<SCRIPT
wget -O - #{GLUSTERFS}/pub.key | apt-key add -

echo deb #{GLUSTERFS}/apt jessie main > /etc/apt/sources.list.d/gluster.list

apt-get update
apt-get install -y glusterfs-server

mkdir -p /data/block1
SCRIPT

$size = 2

Vagrant.configure(2) do |c|
  c.vm.boot_timeout = 60

  c.vm.box = "debian/jessie64"

  $size.times do |n|
    name = "gluster-#{n}"

    c.vm.define name do |g|
      g.vm.hostname = name
      g.vm.network "private_network", ip: "192.168.1.7#{n}"

      g.vm.provision "shell", inline: $script

      g.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.cpus = 1
        vb.memory = 1024

        vb.customize "pre-boot", ['modifyvm', :id, '--nestedpaging', 'off']
      end
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

# vim: set filetype=ruby :
