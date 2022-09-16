*** Settings ***
Library   SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${path}     ${CURDIR}/write_to_file.text
${URL}      http://google.com
*** Test Cases ***
Goole Search
    Open Browser    ${URL}  chrome
    Maximize Browser Window
    create file     ${path}
    input text  xpath://input[@title="Search"]  robot framework
    Press keys  xpath://input[@title="Search"]  ENTER
    ${elem} =   Get Webelements   xpath://div[@id="rso"]/child::div//div[@data-header-feature="0"]//a
    FOR     ${item}     IN   @{elem}
    ${label}     Get Text  ${item}
    ${texts}     Get Element Attribute   ${item}    href
    Log to Console    ${label}${texts}
    ${link} =   Convert To String   ${texts}
    Append to File     ${path}   ${label}\nLink--${link}\n--------------\n    UTF-8

    END
    Close Browser