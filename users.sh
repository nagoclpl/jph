#!/usr/bin/env bash

# users_local.sh

echo

# NOTE 1: data.json figures in .gitignore
# NOTE 2: As data.json may change when running the test, we get it every time before running test
if [ -d jsonplaceholder ]; then (cd jsonplaceholder; git pull)
else git clone https://github.com/typicode/jsonplaceholder.git; fi
echo -e "\nTrying with users.robot which uses remote json server\n"; robot users.robot

exit

echo -e "==============================================================================\n"
echo -e "And now trying with users_local.robot which uses local json server\n"
sed "
  s|https://jsonplaceholder.typicode.com|http://localhost:3000|
  s|new_user.demo.json|newer_user.demo.json|
  s|Gil Alexander|Jil Alexander|
" users.robot > users_local.robot
nc -zv localhost 3000 >/dev/null 2>&1

if [ $? -eq 0 ]; then robot users_local.robot; else
 echo -e "Please start json server in a separate terminal window using the command below"
 echo -e "\njson-server --watch jsonplaceholder/data.json\n"; exit 1
fi
