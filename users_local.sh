#!/usr/bin/env bash

# users_local.sh

nc -zv localhost 3000 >/dev/null 2>&1

if [ $? -ne 0 ]; then
 echo -e "\nPlease start json server in a separate terminal window using the command below"
 echo -e "\njson-server --watch data.json\n"; exit 1
fi

sed "s|https://jsonplaceholder.typicode.com|http://localhost:3000|" users.robot > users_local.robot

robot users_local.robot
