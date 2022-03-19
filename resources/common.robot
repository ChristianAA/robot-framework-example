*** Settings ***
Documentation   Keywords y variables comunes a todos los tests
Resource        imports.robot

*** Keywords ***

Open Browser To Page
    [Arguments]     ${page}
    ${driver_path}=     Get Driver Path
    Run Keyword If  '${browser}' == 'chrome'    Open Chrome Browser To Page    ${page}      ${driver_path}
    ...     ELSE IF   '${browser}' == 'firefox'     Open Firefox Browser To Page    ${page}     ${driver_path}
    ...     ELSE    Fatal Error     Incorrect Browser

Open Chrome Browser To Page
    [Arguments]     ${page}     ${driver_path}
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Run Keyword If  '${headless}' == 'True'   Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    window-size\=1920,1080
    Create Webdriver    Chrome   executable_path=${driver_path}     chrome_options=${chrome_options}
    Maximize Browser Window
    Go To           ${page}

Open Firefox Browser To Page
    [Arguments]     ${page}     ${driver_path}
    IF    '${headless}' == 'True'
        Open Browser    ${page}     Headless Firefox     executable_path=${driver_path}
    ELSE
        Open Browser    ${page}     Firefox         executable_path=${driver_path}
    END
    Maximize Browser Window
    Set Window Size    1920    1080

Get Driver Path
    ${driver_path}=   helpers.Get Driver Path    ${browser}
    [Return]  ${driver_path}
