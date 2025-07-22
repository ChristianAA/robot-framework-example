*** Settings ***
Documentation   Search Page Variables and Keywords
Resource        imports.robot

*** Variables ***
${search_page}          ${url}
${search_input}         css:#searchbox_input
${search_button}        css:#searchbox_homepage [type='submit']

*** Keywords ***

Open Browser To Search Page
    Open Browser To Page    ${search_page}