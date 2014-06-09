#!/usr/bin/env bash


echo "############"
echo "# RVM check: $1"

if which rvm
then
  echo "# ~> RVM already installed"
else
  curl -sSL https://get.rvm.io | bash -s $1
fi


echo "###########################"
echo "# Modify vagrant user group"

sudo usermod --append --groups rvm vagrant
