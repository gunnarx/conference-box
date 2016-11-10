#!/bin/bash -e

USER=vagrant
HOMEDIR=/home/$USER
LXDE_CONF=/etc/lxdm/default.conf

source_dir="/vagrant/files"

[ -d "$source_dir" ]

sudo apt-get install -y firefox
sudo apt-get install -y openjdk-7-jre
sudo apt-get install -y libxmu6
sudo apt-get install -y icedtea-7-plugin 

sudo apt-get install -y lxde --fix-broken
# These dependencies always fail installation and the error sticks around - I don't think we need them
sudo apt-get remove -y dictionaries-common miscfiles

# Copy files into home dir
echo "Running: rsync -a $source_dir/ $HOMEDIR/"
ls -aF "$source_dir"
rsync -a "$source_dir/" "$HOMEDIR/"
chown -R $USER:$USER $HOMEDIR

# Remove some unnecessary packages, clear apt caches and clean up
# (Although none of this actually reduces disk file size since we're not
# zeroing the data on the disk and reducing the image size accordingly)
apt-get remove -y lxmusic juju --auto-remove
apt-get autoremove
apt-get autoclean
apt-get clean
rm -rf /tmp/* /var/{cache,tmp}/* /var/lib/apt/lists/*

# Firefox plugin configuration
sudo update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/java-7-openjdk-i386/jre/lib/i386/IcedTeaPlugin.so

# The blacklist gets rid of all useless login names from LXDM login screen
# However, then autologin is added anyway, so the login screen is skipped.
# BUT autologin failed to work, maybe the whitelist is required for this.
# Since this configuration works I'll just leave it as-is, even the blacklist
# is kept for possible future use.
echo "[base]" >>$LXDE_CONF
echo "white=$USER" >>$LXDE_CONF
echo "black=syslog usbmux messagebus pollinate colord statd puppet" >> $LXDE_CONF
echo -e "[base]\nautologin=$USER" >> $LXDE_CONF
deluser ubuntu puppet || true

