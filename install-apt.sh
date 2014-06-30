#!/usr/bin/env bash

echo "#########"
echo "# apt-get"

apt-get update
apt-get install -y build-essential openssl libreadline6 zlib1g zlib1g-dev git-core sqlite3 libsqlite3-dev postgresql libpq-dev curl python-software-properties nodejs libcurl4-openssl-dev libreadline6-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion apt-transport-https ca-certificates libgdbm-dev libffi-dev

# lynx (alternative to curl for some use cases)
apt-get install -y lynx

# rspec (rails in general?) requires these.
apt-get install -y libgtk2.0 libgtkmm-2.4 libgtkmm-3.0
apt-get install -y libnotify4

