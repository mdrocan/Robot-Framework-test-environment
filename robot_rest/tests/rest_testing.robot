*** settings ***
Resource    resource.robot
Library     REST  http://echo.jsontest.com

*** test cases ***
Run Linter
    Verify test

Simple Request
    GET  /framework/robot-framework/api/rest
    Object  response body
    String  response body api  rest
    String  response body framework  robot-framework
