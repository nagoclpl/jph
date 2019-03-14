# hw.py

from flask import Flask, request, json, jsonify

app = Flask(__name__)

@app.route("/")
def index():
    return "Index Page"

@app.route("/hello")
def hello():
    return "Hello World!"

@app.route("/parse", methods=['POST'])
def parse():
    s = request.json['s']
    chars = list(s)
    l = []

    for c in chars:
        if c=='(' or c=='[' or c=='{':
            l.append(c)
        elif c==')':
            if len(l)==0:
                return jsonify("{ \"status\": \"failure\" }")
            elif l[-1]=='(':
                l.pop()
        elif c==']':
            if len(l)==0:
                return jsonify("{ \"status\": \"failure\" }")
            elif l[-1]=='[':
                l.pop()
        elif c=='}':
            if len(l)==0:
                return jsonify("{ \"status\": \"failure\" }")
            elif l[-1]=='{':
                l.pop()
        else:
            None

    if len(l)==0:
        return jsonify("{ \"status\": \"success\" }")
    else:
        return jsonify("{ \"status\": \"failure\" }")
