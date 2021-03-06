# jph

You can test Robot Framework (https://robotframework.org/) with either of these -

1. Remote JSON Server
2. Local JSON Server - Highly Recommended!

Refer -

1. https://robotframework.org/
2. https://jsonplaceholder.typicode.com/
3. https://github.com/typicode/json-server

## Prerequisites

- To run Local JSON Server, you need node. You can install node on Mac using `brew install node`

## Steps

If you want to test with local json server (highly recommended), then do this -

```
cd
git clone https://github.com/typicode/jsonplaceholder.git
cd jsonplaceholder
npm install # just a one time thing
npm start   # whenever you want to start the server
```

You should have a running local json server listening on port 3000 now.

In another terminal window -

Run users_local.sh (it has the ```robot users_local.robot``` line within it) -

```./users_local.sh```

If you want to test with remote json server (not recommended), then do this -

```./users_remote.sh```

The only time you may want to test with remote json server is just to validate or crosscheck against the local json server in terms of functionalities like how many tests are passing/failing, etc. And the only other reason would be you don't want to run a local json server for whatever reason. Running a local json server is highly recommended however, as you come to know what is happening on the json server side by viewing the console logs and/or debugging.

While this README speaks about "users", we can easily test with other entities like -

1. posts
2. comments
3. albums
4. photos
5. todos
