Simple Conferencing in sandboxed VM (Webex, Zoom, ...)
======================================================

This is nothing really special...

Goal:
-----
- Provide a ready to run an isolated Zoom (or WebEx*) Conferencing environment that can be run on Linux.
- Download and install the software to be able to run the software on Linux
- Run X, not Wayland, to enable screen sharing (but keeping your host system safe, isolated from the VM)
- NOTE: Master branch has been switched to Zoom only -- see below.

How:
-----
- Using Vagrant to create a fresh virtual machine image
- Base OS:  Ubuntu with a small(ish) desktop environment: LXDE
- Uses 32-bit OS (legacy, because WebEx Java plugins required it before. This will likely change at some point because Zoom has a 64-bit native client)
- Install Firefox + Zoom native client

\*Branches (IMPORTANT):
--------------------

Master branch has now been switched over to install only Zoom, because we no longer use WebEx at GENIVI.  If you want to use WebEx - consider the webex+zoom branch -- however it should be considered unsuppported.

Running:
--------

1. Install Vagrant & VirtualBox

2. Clone project, cd to project dir and run:
```
$ vagrant up --provision
```
3. Open VirtualBox user interface and **restart** the VM

Tweaks:
-------
Depending on your system resources you could tweak memory or number of CPUs for better perfomance - either in the Vagrantfile before building, or later on in the VirtualBox user interface.

TODO:
-----
- Automate the setup of shared folder, used for example to share some documents on screen. NOTE: You can still do this up manually in VirtualBox after the VM is created, and mount the disk inside the VM.


