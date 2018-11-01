*** Settings ***
Library    XML
Library    Process
Library    OperatingSystem

Documentation   Test suite should always import only one resource file.
...  Thus, ideally your resource files create a tree structure while
...  importing. This resource file should be the common root for them all where
...  project-wide keywords, imports, and other settings reside.

*** Variables ***
${filename}    example_resp.xml
${location}      /tmp/tests/
${file} =    Parse XML    ${location}${filename}

*** Keywords ***
Verify Test
    ${linter} =    Run    rflint /tmp/tests/
    Log    ${linter}

Getfile
    Run    apk add wget
    ${put} =    Run    wget http://web/${filename}
    Log    ${put}

Verify File
    File Should Exist    ${location}${filename}

Findfile
    ${output} =    Run    find / -name ${filename}
    Log    ${output}

Validate XML
    ${file} =    Parse XML    ${location}${filename}
    Should Be Equal    ${file.tag}    example
    ${first} =    Get Element    ${file}    first
    Should Be Equal    ${first.text}    jotain

    @{texts} =    Get Elements Texts    ${location}${filename}    third/child
    Length Should Be	${texts}	2
    Should Be Equal	@{texts}[0]	more text
    Should Be Equal	@{texts}[1]	${EMPTY}

2Validate XML
    ${file} =    Parse XML    ${location}${filename}
    Should Be Equal    ${file.tag}    example
    ${first} =    Get Element    ${file}    first
    Should Be Equal    ${first.text}    jotain

3Validate XML
    ${file} =    Parse XML    ${location}${filename}
    @{texts} =    Get Elements Texts   ${location}${filename}    toinen/homma
    Length Should Be    ${texts}    3

4Validate XML
    ${file} =    Parse XML    ${location}${filename}
    ${_text} =    Get Element    ${file}    fourth/aakkonen
    Should Be Equal    ${_text.text}    tekstiä