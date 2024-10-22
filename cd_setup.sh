#!/bin/bash

# refresh the apt lists
rm -vf /var/lib/apt/lists/*

# update the repos
apt update

# install git
apt install git -y

# clone the repo
git clone https://github.com/alexmccartneymoore/puppy_setup.git

cd puppy_setup

# cp or move the config files 
cp jwmrc-theme ~/.jwm/jwmrc-theme
cp .jwmrc-tray ~/.jwmrc-tray

# either download image to use 
# or change the background for ROX
#sed -i -e 's/\/.*.jpg/\/Blue.jpg/' /root/Choices/ROX-Filer/PuppyPin
cp PuppyPin ~/Choices/ROX-Filer/PuppyPin

# reload rox
rox -p /root/Choices/ROX-Filer/PuppyPin

# remove conky
apt remove conky -y

# restart jwm
jwm -restart
