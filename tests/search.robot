*** Settings ***
Documentation   Home Page Search Tests
Test Setup      Open Browser To Search Page
Test Teardown   Close Browser
Resource        ../resources/imports.robot

*** Variables ***
${search_text}      Robot Framework WebPage

*** Test Cases ***
User can do a search from the home page
    Input Search Text    ${search_text}
    Click Search Button
    Wait Until Page Contains Element     ${result_links}
