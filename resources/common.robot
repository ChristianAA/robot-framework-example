*** Settings ***
Documentation   Common Variables And Keywords
Resource        imports.robot
Library         SeleniumLibrary

*** Keywords ***

Open Browser To Page
    [Arguments]     ${page}
    Run Keyword If    '${browser}' == 'chrome'    Open Chrome Browser To Page    ${page}
    ...     ELSE IF   '${browser}' == 'firefox'   Open Firefox Browser To Page    ${page}
    ...     ELSE      Fatal Error     Incorrect Browser

Open Chrome Browser To Page
    [Arguments]    ${page}
    Prepare Driver    ${browser}
    ${chrome_options}=    Get Chrome Options
    Run Keyword If    ${headless}    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    Call Method    ${chrome_options}    add_argument    --user-agent\=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36
    Create Webdriver    Chrome    options=${chrome_options}
    Maximize Browser Window
    Go To    ${page}

Open Firefox Browser To Page
    [Arguments]    ${page}
    Prepare Driver    ${browser}
    ${firefox_options}=    Get Firefox Options
    Run Keyword If    ${headless}    Call Method    ${firefox_options}    add_argument    --headless
    Call Method    ${firefox_options}    add_argument    --window-size\=1920,1080
    Call Method    ${firefox_options}    set_preference    general.useragent.override    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36
    Create Webdriver    Firefox    options=${firefox_options}
    Maximize Browser Window
    Go To    ${page}

Click Search Button
    ${clicked}=    Run Keyword And Return Status    Click First Visible    ${search_button_selectors}
    Run Keyword If    not ${clicked}    Press Enter In First Visible    ${search_input_selectors}

Input Search Text
    [Arguments]    ${text}
    Wait Until Keyword Succeeds    10s    300ms    Input Text In First Visible    ${search_input_selectors}    ${text}