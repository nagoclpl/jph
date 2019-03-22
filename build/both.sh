#!/usr/bin/env bash

echo

for ans in yes no; do

  if [ "$ans" == "yes" ]; then
    ./gradlew -Pprod=$ans -Prepo=thedockguy/gohw start
  else
    ./gradlew -Pprod=$ans -Prepo=thedockguy/gohw start $1
  fi

  echo; ls -l work; echo

done
