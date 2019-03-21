#!/usr/bin/env bash

# build.sh

let ec=0

panic() {
  rm -f src/.dockerignore
  echo -e "\n$1\n"
  let ec=$ec+1
  exit $ec
}

if [ "$PROD" = "yes" ]; then
  echo '*.py' > src/.dockerignore
  echo '*.robot' >> src/.dockerignore
elif [ "$PROD" == "no" ]; then
  :
else
  panic "PROD env var is not set"
fi

go build src/hello_world.go; [ $? -ne 0 ] && panic "Go Build Failed"

echo; ./hello_world

if [ $? -eq 0 ]; then
  rm hello_world
else
  panic "Run Failed"
fi

echo

docker build -t thedockguy/gohw src; [ $? -ne 0 ] && panic "Docker Build Failed"; echo

docker push thedockguy/gohw; [ $? -ne 0 ] && panic "Docker Push Failed"; echo

docker run thedockguy/gohw; [ $? -ne 0 ] && panic "Docker Run Failed" || rm -f src/.dockerignore; echo
