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

# remove conky
apt remove conky -y

# restart jwm
jwm -restart
