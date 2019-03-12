#!/usr/bin/env bash

# users_local.sh

nc -zv localhost 3000 >/dev/null 2>&1

if [ $? -ne 0 ]; then
 echo -e "\nPlease start json server in a separate terminal window using the command below"
 echo -e "\njson-server --watch jsonplaceholder/data.json\n"; exit 1
fi

# NOTE 1: data.json figures in .gitignore
# NOTE 2: As data.json may change when running the test, we get it every time before running test
if [ -d jsonplaceholder ]; then
  (cd jsonplaceholder; git pull)
else
  git clone https://github.com/typicode/jsonplaceholder.git
fi

sed "s|https://jsonplaceholder.typicode.com|http://localhost:3000|" users.robot > users_local.robot

robot users_local.robot
