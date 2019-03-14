#!/usr/bin/env bash

# users_local.sh

echo; nc -zv localhost 3000 >/dev/null 2>&1; if [ $? -eq 0 ]; then robot users_local.robot; else
 echo -e "Please start json server in a separate terminal window using the commands below"
 echo -e "\ncd ~/jsonplaceholder\n"; echo -e "npm start\n"; exit 1
fi

robot users_local.robot

if [ "`uname -s`" == "Darwin" ]; then
  type realpath && open file://`realpath report.html` || \
    echo -e "\nPlease brew install coreutils\n"
fi
