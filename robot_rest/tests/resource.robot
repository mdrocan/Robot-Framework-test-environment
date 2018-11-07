*** Settings ***
Library    OperatingSystem

Documentation   Test suite should always import only one resource file.

*** Variables ***
${location}      /tmp/tests/

*** Keywords ***
Verify Test
    ${linter} =    Run    rflint ${location}
    Log    ${linter}