#!/usr/bin/env bash

echo

for ans in yes no; do

  if [ "$ans" == "yes" ]; then
    ./gradlew -Pprod=$ans -Prepo=thedockguy/gohw_prod start
  else
    ./gradlew -Pprod=$ans -Prepo=thedockguy/gohw_test start
  fi

  echo; ls -l work; echo

done
