*** Settings ***
Library    Process
Library    OperatingSystem

Documentation   Test suite should always import only one resource file.
...  Thus, ideally your resource files create a tree structure while
...  importing. This resource file should be the common root for them all where
...  project-wide keywords, imports, and other settings reside.

*** Variables ***

*** Keywords ***
Verify Test
    ${linter} =    Run    rflint /tmp/tests/
    Log    ${linter}