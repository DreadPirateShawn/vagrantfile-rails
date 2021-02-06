#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive


echo "############"
echo "# RVM check"

if which rvm
then
  echo "# ~> RVM already installed"
else
  # Instructions per https://rvm.io/rvm/install
  sudo apt-get install software-properties-common
  sudo apt-add-repository -y ppa:rael-gc/rvm
  sudo apt-get -qq update
  sudo apt-get install -y rvm
fi


echo "###########################"
echo "# Modify vagrant user group"

sudo usermod --append --groups rvm vagrant
groups vagrant
