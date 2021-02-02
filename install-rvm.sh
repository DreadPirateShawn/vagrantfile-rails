#!/usr/bin/env bash


echo "############"
echo "# RVM check: $1"

if which rvm
then
  echo "# ~> RVM already installed"
else
  # Instructions per https://rvm.io/rvm/install
  command curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
  command curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg --import -
  curl -sSL https://get.rvm.io | bash -s $1
fi


echo "###########################"
echo "# Modify vagrant user group"

sudo usermod --append --groups rvm vagrant

