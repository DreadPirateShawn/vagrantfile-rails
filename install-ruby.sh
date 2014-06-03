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
  rvm use --install $ruby_version
fi


echo "##############"
echo "# Install gems"

shift

if (( $# ))
then
  gem install $@
fi

