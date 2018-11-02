*** Settings ***
Library    Process
Library    OperatingSystem

Documentation   Test suite should always import only one resource file.

*** Variables ***

*** Keywords ***
Verify Test
    ${linter} =    Run    rflint /tmp/tests/
    Log    ${linter}