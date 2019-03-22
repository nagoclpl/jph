#!/usr/bin/env bash

# PROD

echo
echo "............"
echo "... PROD ..."
echo "............"
echo

./gradlew -Pprod=yes -Prepo=thedockguy/gohw start

echo; ls -l temp work hello_world; echo

# TEST

echo
echo "............"
echo "... TEST ..."
echo "............"
echo

./gradlew -Pprod=no -Prepo=thedockguy/gohw start $1

echo; ls -l work hello_world; echo
