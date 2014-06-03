#!/usr/bin/env bash

echo "#####################"
echo "# Postgres user check"

user=$1

if ! (sudo -u postgres psql template1 -c '\du' | grep $user)
then
  sudo -u postgres createuser $user --createdb
else
  echo "# ~> Postgres user $user already exists"
fi
