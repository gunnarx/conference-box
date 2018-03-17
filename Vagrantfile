# (C) 2014-2016 Gunnar Andersson
# License: Your choice of CC-BY-4.0, MPLv2, GPLv2/3+
# License text for MPLv2 provided in root directory.

# -*- mode: ruby -*-
# vim: set ft=ruby sw=4 ts=4 tw=0 et:

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Apparently this needs to be specified if Vagrant has alternative options
# (try other Vagrant providers at your own risk)
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

   # Set defaults, if not defined by environment variables
   hostname = ENV['VMNAME']
   hostname = 'webex-linux-box' if hostname == nil

   # Getting user real name from host, let's assume we want the same in guest
   user = `whoami`
   realname = `getent passwd vagrant`.split(/:/)[4]

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

   # Folder shared with host

   # Note that VirtualBox Guest Extensions must be installed.
   # There is a vagrant plugin to automate this

   # Although this is now set up only for Virtualbox, the following command
   # is a more portable abstraction (Vagrant will choose appropriate shared
   # folder setting depending on specified type).
   # Alternatively something like:   ', type: "virtualbox"'   could be
   # added to force type
   config.vm.synced_folder "~/vmshare-webex", "/home/vagrant/vmshare-webex"


   # PROVISIONING

   config.vm.provision :shell, inline:
      'echo "***************************************************************"
       echo "Starting provisioning. "
       echo "***************************************************************"'

   # Run final installation script, if it exists, and fix ownership of
   # root-created files.
   config.vm.provision :shell, inline:
   " [ -f /vagrant/script.sh ] && /vagrant/script.sh 
      echo #{vmname} >/vagrant/VMNAME
      sudo chown -R vagrant:vagrant /home/vagrant
   "

   config.vm.provision :shell, inline:
   "echo \"Setting your real name to #{realname} (copied from host user #{user})\"
    sudo chfn -f \"#{realname}\" vagrant"

end
