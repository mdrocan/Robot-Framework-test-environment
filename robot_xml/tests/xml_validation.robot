*** Settings ***
Resource    resource.robot

**** Variables ***
#${PROJECTROOT}

*** Keywords ***
    [Documentation]    Keywords should only be promoted to resource file when
    ...                they are used in more than one place

*** Test cases ***
Run Linter
    Verify test

Wget File
    Getfile
    Findfile

Validate Response
    Validate XML
    2Validate XML
    3Validate XML
    4Validate XML