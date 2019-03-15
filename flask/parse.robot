*** Settings ***
Library         REST    http://localhost:5000
Library         Process

*** Variables ***
${success_string}=  { "status": "success" }
${failure_string}=  { "status": "failure" }

*** Test Cases ***

#---------------------------------------
# Unmatched ones, just one opening char
#---------------------------------------

POST "(" to check if it is malformed
  POST        /parse                   { "s": "(" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($failure_string)    json
  Should be equal  &{data}[status]  failure

POST "[" to check if it is malformed
  POST        /parse                   { "s": "[" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($failure_string)    json
  Should be equal  &{data}[status]  failure

POST "{" to check if it is malformed
  POST        /parse                   { "s": "{" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($failure_string)    json
  Should be equal  &{data}[status]  failure

#---------------------------------------
# Unmatched ones, just one closing char
#---------------------------------------

POST ")" to check if it is malformed
  POST        /parse                   { "s": ")" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($failure_string)    json
  Should be equal  &{data}[status]  failure

POST "]" to check if it is malformed
  POST        /parse                   { "s": "]" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($failure_string)    json
  Should be equal  &{data}[status]  failure

POST "}" to check if it is malformed
  POST        /parse                   { "s": "}" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($failure_string)    json
  Should be equal  &{data}[status]  failure

#---------------------------------------
# Matched ones
#---------------------------------------

POST "()" to check if it is wellformed
  POST        /parse                   { "s": "()" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($success_string)    json
  Should be equal  &{data}[status]  success

POST "[]" to check if it is wellformed
  POST        /parse                   { "s": "[]" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($success_string)    json
  Should be equal  &{data}[status]  success

POST "{}" to check if it is wellformed
  POST        /parse                   { "s": "{}" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($success_string)    json
  Should be equal  &{data}[status]  success

#---------------------------------------
# Others
#---------------------------------------

POST "[{]}" to check if it is wellformed/malformed
  POST        /parse                   { "s": "[{]}" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($success_string)    json
  Should be equal  &{data}[status]  success

POST "[]{}" to check if it is wellformed/malformed
  POST        /parse                   { "s": "[]{}" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($success_string)    json
  Should be equal  &{data}[status]  success

POST "[{}]" to check if it is wellformed/malformed
  POST        /parse                   { "s": "[{}]" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($success_string)    json
  Should be equal  &{data}[status]  success

POST "[{a}]" to check if it is wellformed/malformed
  POST        /parse                   { "s": "[{a}]" }
  Integer     response status          200
  &{data}=    Evaluate     json.loads($success_string)    json
  Should be equal  &{data}[status]  success

