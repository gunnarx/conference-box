# (C) 2014-2016 Gunnar Andersson
# License: MPLv2

# -*- mode: ruby -*-
# vim: set ft=ruby sw=4 ts=4 tw=0 et:

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Apparently this needs to be specified if Vagrant has alternative options
# (try other Vagrant providers at your own risk)
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

   # Set defaults, or as defined by environment variables

   hostname = ENV['VMNAME']
   hostname = 'webex-linux-box' if hostname == nil

   box = ENV['BOX']
   box = "trusty32" if box == nil

   box_url = ENV['BOX_URL']
   box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box" if box_url == nil

   config.vm.box = box
   config.vm.hostname = hostname
   config.vm.box_url = box_url

   # Set a unique tag
   vmname = config.vm.hostname + "-" + Time.now.strftime("%Y%m%d%H%M")
   config.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize [ "modifyvm", :id, "--name", vmname ]
      vb.customize [ "modifyvm", :id, "--memory", "2048" ]
      vb.customize [ "modifyvm", :id, "--vram", "128" ]
      vb.customize [ "modifyvm", :id, "--clipboard" , "bidirectional" ]
      vb.customize [ "modifyvm", :id, "--cpus", 2 ]
   end

   config.vm.provision :shell, inline:
      'echo "***************************************************************"
       echo "Starting provisioning. "
       echo "***************************************************************"'

      # Run final installation script, if it exists
      config.vm.provision :shell, inline:
      " [ -f /vagrant/script.sh ] && /vagrant/script.sh 
        echo #{vmname} >/vagrant/VMNAME
      "
      # Created/copied files, are owned by root after provisioning - fix that
      config.vm.provision :shell, inline:
      " sudo chown -R vagrant:vagrant /home/vagrant
      # Remove other users than vagrant -- makes things less confusing
      sudo deluser ubuntu   # Might fail but that is ok
      true                  # Make sure Vagrant does not stop on error
      "
end
