#!/usr/bin/env python3

# Parse.py

import sys

def par(s):
    print(s)
    return s

def parse(s):
    print(s)
    chars = list(s); l = []

    for c in chars:
        if c=='(' or c=='[' or c=='{':
            l.append(c)
        elif c==')':
            if len(l)==0:
                return par("failure")
            elif l[-1]=='(':
                l.pop()
        elif c==']':
            if len(l)==0:
                return par("failure")
            elif l[-1]=='[':
                l.pop()
        elif c=='}':
            if len(l)==0:
                return par("failure")
            elif l[-1]=='{':
                l.pop()
        else:
            None

    if len(l)==0:
        return par("success")
    else:
        return par("failure")

if __name__ == "__main__":
    parse(sys.argv[1])
