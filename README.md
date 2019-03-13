# jph

You can test with either of these -

1. Remote JSON Server
2. Local JSON Server

Refer -

1. https://jsonplaceholder.typicode.com/
2. https://github.com/typicode/json-server

## Steps

If you want to test with local json server (recommended), then do this -

```
cd
git clone https://github.com/typicode/jsonplaceholder.git
cd jsonplaceholder
node index.js
```

You should have a running local json server listening on port 3000 now

Run users_local.sh (it has the ```robot users_local.robot``` line within it) in another terminal window -

```./users_local.sh```

If you want to test with remote json server (not recommended), then do this -

```./users_remote.sh```

The only time you may want to test with remote json server is just to validate or crosscheck against the local json server in terms of functionalities like how many tests are passing/failing, etc. And the only other reason would be you don't want to run a local json server for whatever reason. Running a local json server is highly recommended however, as you come to know what is happening on the json server side by viewing the console logs and/or debugging.

While this README speaks about "users", we can easily test with other entities like -

1. posts
2. comments
3. albums
4. photos
5. users
6. todos
