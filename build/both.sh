#!/usr/bin/env bash

echo

for ans in yes no; do

  if [ "$ans" == "yes" ]; then
    ./gradlew -Pprod=$ans -Prepo=thedockguy/gohw start
    echo; ls -l temp work; echo
  else
    ./gradlew -Pprod=$ans -Prepo=thedockguy/gohw start $1
    echo; ls -l temp work; echo
  fi

done
