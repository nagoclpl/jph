#!/usr/bin/env bash

echo -e "\nContainer Hostname is `hostname`"

echo -e "\nFiles in Container's app dir ..."

echo; ls

echo; python -V

echo

if [ -f hello_world.tgz ]; then
  tar xfz hello_world.tgz
  go run hello_world.go
fi
