#!/usr/bin/env bash

echo -e "\nContainer Hostname is `hostname`"

echo -e "\nFiles in Container's app dir ..."

echo; ls

echo; python -V

echo; [ -f hello_world.go ] && go run hello_world.go
