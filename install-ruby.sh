#!/usr/bin/env bash

ruby_version=$1


echo "#############"
echo "# Ruby check: $ruby_version"

source /usr/local/rvm/scripts/rvm

if (rvm list | grep $ruby_version)
then
  echo "# ~> Ruby $ruby_version already installed"
  rvm use $ruby_version
else
  # Disable binary to force compiling from source,
  #   which ensures that dev headers are present,
  #   which can avoid errors like: https://stackoverflow.com/q/7645918
  rvm use --install $ruby_version --disable-binary
fi


echo "##############"
echo "# Install gems"

gem install rails --version '4.1.4'
gem install i18n --version '0.6.9'

