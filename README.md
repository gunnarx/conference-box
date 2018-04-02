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
- Using Vagrant to create a fresh [VirtualBox (https://www.virtualbox.org/) virtual machine image
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
3. Open the VirtualBox user interface, find the VM and **restart** the VM
(Do a clean ACPI Shutdown, followed by Start.  Alternatively from command line: vagrant halt ; vagrant up)

Troubleshooting:
----------------

If you have issues with any of this:
 - Shared folder won't work
 - Guest screen won't resize when you resize the VirtualBox window (or set it to full screen)

... then you likely have mismatched guest additions installed.

VirtualBox support is beyond this project - please look elsewhere.  It's always a challenge to get the guest OS set up correctly because you host system changes, VirtualBox version changes, but the guest OS might not. In particular the guest additions need to match the VirtualBox version. Since this is based on a fixed base box, there is no way to guarantee that, but installing [vagrant guest additions plugin](https://github.com/dotless-de/vagrant-vbguest) BEFORE running vagrant up / provisioning, might help.

Tweaks:
-------
Depending on your system resources you could tweak memory or number of CPUs for better perfomance - either in the Vagrantfile before building, or later on in the VirtualBox user interface.

TODO:
-----
- Automate the setup of shared folder, used for example to share some documents on screen. NOTE: You can still do this up manually in VirtualBox after the VM is created, and mount the disk inside the VM.


