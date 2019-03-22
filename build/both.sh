#!/usr/bin/env bash

#-----------------------------------------------------------
# both.sh - the word both signifies what this script does -
#-----------------------------------------------------------
# 1. builds and tests for PROD environment
# 2. builds and tests for NON-PROD (TEST) environment
#-----------------------------------------------------------

#------
# PROD
#------

echo
echo "............"
echo "... PROD ..."
echo "............"
echo

./gradlew -Pprod=yes -Prepo=thedockguy/gohw start

echo; ls -l temp work hello_world; echo

rm -fr temp work hello_world

#------
# TEST
#------

echo
echo "............"
echo "... TEST ..."
echo "............"
echo

./gradlew -Pprod=no -Prepo=thedockguy/gohw start $1

echo; ls -l work; echo

rm -fr work
