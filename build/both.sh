#!/usr/bin/env bash

echo; for ans in yes no; do
  ./gradlew -Pprod=$ans -Prepo=thedockguy/gohw start
  echo; ls -l work; echo
done
