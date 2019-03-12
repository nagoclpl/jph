#!/usr/bin/env bash

#---------------------------------------------------------------------------------
# test.sh
#---------------------------------------------------------------------------------
# Please go through https://jsonplaceholder.typicode.com/ if you haven't already
#---------------------------------------------------------------------------------

nc -zv localhost 3000 >/dev/null 2>&1

if [ $? -ne 0 ]; then
 echo -e "\nPlease start json server using the command below"
 echo -e "\njson-server --watch db.json\n"
 exit 1
fi

curl() { /usr/local/opt/curl/bin/curl "$@"; echo; }
[ ! -f db.json ] && cp data.json db.json

#-----
# GET
#-----
let LAST_ID=`jq '.posts | reverse[0].id' db.json`
echo -e "\nLAST_ID is $LAST_ID\n"
for POST_ID in `seq 1 $LAST_ID`; do
  echo -e "GET for POST_ID: $POST_ID\n-----------------------"
  curl localhost:3000/posts/$POST_ID
  echo
done

#------
# POST
#------
let NEXT_ID=$LAST_ID+1
echo -e "NEXT_ID is $NEXT_ID\n"
echo -e "POST\n-----------------------"
curl -d '' localhost:3000/posts

echo
