#!/usr/bin/env python3

# test.py

import requests, json
from termcolor import colored

d = {}

d[""]="success"
d[" "]="success"

d["("]="failure"
d["["]="failure"
d["{"]="failure"

d[")"]="failure"
d["]"]="failure"
d["}"]="failure"

d["()"]="success"
d["[]"]="success"
d["{}"]="success"

for e in d:
    r = requests.post('http://localhost:5000/parse', json={"s":e})
    j = json.loads(r.json())
    if d[e]==j['status']:
        print('It is', colored('PASS', 'green'), 'for =>' + e + '<=', d[e], 'in parsing, as expected')
    else:
        print('It is', colored('FAIL', 'red'), 'for =>' + e + '<=', d[e], 'in parsing, as not expected')
