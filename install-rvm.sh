#!/usr/bin/env bash


echo "############"
echo "# RVM check: $1"

if which rvm
then
  echo "# ~> RVM already installed"
else
  # Instructions per https://rvm.io/rvm/install
  gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash -s $1
fi


echo "###########################"
echo "# Modify vagrant user group"

sudo usermod --append --groups rvm vagrant

