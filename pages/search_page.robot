*** Settings ***
Documentation   Search Page Variables and Keywords
Resource        ../resources/imports.robot

*** Variables ***
${search_page}          ${url}
${search_input}         #searchbox_input
${search_input_alt}     textarea[name="q"]
${search_input_selectors}    ${search_input}||${search_input_alt}
${search_button}        button[data-mode="search"]
${search_button_alt}    button[type="submit"]
${search_button_alt2}   input[type="submit"]
${search_button_selectors}    ${search_button}||${search_button_alt}||${search_button_alt2}

*** Keywords ***

Open Browser To Search Page
    Open Browser To Page    ${search_page}