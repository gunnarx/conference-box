Simple Webex Linux box
======================

This is nothing really special:

Goal:
-----
- Provide a ready to run and isolated WebEx environment that can be run on Linux.
- Install the software (Browser, Java & Plugin) to be able to run WebEx on Linux
- Avoid the mess of mixing 32-bit versions of Java into your 64 bit system.
- Run X, not Wayland, to enable screen sharing (but keeping your host system safe, isolated from the VM)

How:
-----
- Using Vagrant to create a fresh virtual machine image
- Base OS:  Ubuntu with a small(ish) desktop environment: LXDE
- WebEx seems to require 32-bit Java versions.  To keep it simple, the base OS is therefore 32 bit.
- Install Firefox + plugins

Running:
--------

1. Install Vagrant & VirtualBox

2. Clone project, cd webex-box and run:
```
$ vagrant up --provision
```
3. Open VirtualBox user interface and restart the VM

Tweaks:
-------
Depending on your system resources you could tweak memory or number of CPUs for better perfomance - either in the Vagrantfile before building, or later on in the VirtualBox user interface.

TODO:
-----
- Provide a directory shared with the host, used for example to share some documents on screen. (You can still do this up manually in VirtualBox after the VM is created, and mount the disk inside the VM)


