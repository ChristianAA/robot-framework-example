*** Settings ***
Documentation   Search Page Variables and Keywords
Resource        imports.robot

*** Variables ***
${search_page}          ${url}
${search_input}         //*[@id='search_form_input_homepage']
${search_button}        //*[@id='search_button_homepage']

*** Keywords ***

Open Browser To Search Page
    Open Browser To Page    ${search_page}
