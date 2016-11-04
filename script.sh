#!/bin/bash -e

source_dir="/vagrant/files"

[ -d "$source_dir" ]

echo "Running: rsync -a $source_dir/ /home/vagrant/"
ls -aF "$source_dir"
rsync -a "$source_dir/" /home/vagrant/

sudo apt-get install -y firefox 
sudo apt-get install -y icedtea-web 
sudo apt-get install -y openjdk-8-dev
sudo apt-get install -y pangox-compat
sudo apt-get install -y libXmu
sudo apt-get install -y mesa-libEGL
sudo apt-get install -y gtk2
sudo apt-get install -y libpng
sudo apt-get install -y alsa-lib
sudo apt-get install -y libXtst
sudo apt-get install -y libart_lgpl
sudo apt-get install -y #sudo apt-get install -y lxde
icedtea-7-plugin
