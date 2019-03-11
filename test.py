#!/usr/bin/env python3

#---------------------------------------------------------------------------------
# test.sh
#---------------------------------------------------------------------------------
# Please go through https://jsonplaceholder.typicode.com/ if you haven't already
#---------------------------------------------------------------------------------

import requests

r = requests.get('http://localhost:3000/posts/1')

print('Status code:', r.status_code)
print('Content type:', r.headers['content-type'])
print('Encoding', r.encoding)
print('Body:', r.text)
print('JSON:', r.json())
