#!/bin/bash

nc -zv localhost 3000 >/dev/null 2>&1

if [ $? -ne 0 ]; then
 echo -e "\nPlease start json server using the command below"
 echo -e "\njson-server --watch db.json\n"
 exit 1
fi

curl() { /usr/local/opt/curl/bin/curl "$@"; echo; }

echo

[ ! -f db.json ] && cp db_seed.json db.json

LAST_ID=`jq '.posts' db.json | tail -3 | awk '{print $2; exit}'`
echo -e "\nLAST_ID is $LAST_ID\n"

#-----
# GET
#-----
for POST_ID in `seq 1 $LAST_ID`; do
  echo -e "GET for POST_ID: $POST_ID\n-----------------------"
  curl localhost:3000/posts/$POST_ID
  echo
done

#------
# POST
#------
echo -e "POST\n-----------------------"
curl -d '{ "id": 4, "title": "Post 4" }' localhost:3000/posts

echo
