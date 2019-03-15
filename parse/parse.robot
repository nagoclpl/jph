*** Settings ***
Library  Parse.py

*** Variables ***

*** Test Cases ***

# just the open ones

Parse '('
  ${result}=  Parse.parse  (
  Should be equal  ${result}  failure

Parse '['
  ${result}=  Parse.parse  (
  Should be equal  ${result}  failure

Parse '{'
  ${result}=  Parse.parse  (
  Should be equal  ${result}  failure

# just the close ones

Parse ')'
  ${result}=  Parse.parse  )
  Should be equal  ${result}  failure

Parse ']'
  ${result}=  Parse.parse  ]
  Should be equal  ${result}  failure

Parse '}'
  ${result}=  Parse.parse  }
  Should be equal  ${result}  failure

# criss-cross

Parse '([)]'
  ${result}=  Parse.parse  ([)]
  Should be equal  ${result}  failure

# matched ones

Parse '()'
  ${result}=  Parse.parse  ()
  Should be equal  ${result}  success

Parse '[]'
  ${result}=  Parse.parse  []
  Should be equal  ${result}  success

Parse '{}'
  ${result}=  Parse.parse  {}
  Should be equal  ${result}  success
