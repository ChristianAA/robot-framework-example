*** Settings ***
Documentation   Keywords y variables comunes a todos los tests
Resource        imports.robot

*** Keywords ***

Open Browser To Page
    [Arguments]     ${page}
    ${driver_path}=     Get Driver Path
    Run Keyword If  '${browser}' == 'chrome'    Open Chrome Browser To Page    ${page}      ${driver_path}
    ...     ELSE IF   '${browser}' == 'firefox'     Open Firefox Browser To Page    ${page}     ${driver_path}
    ...     ELSE IF   '${browser}' == 'edge'     Open Edge Browser To Page    ${page}    ${driver_path}
    ...     ELSE    Fatal Error     Incorrect Browser

Open Chrome Browser To Page
    [Arguments]     ${page}     ${driver_path}
    ${chrome_options}=     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If  '${headless}' == 'True'   Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    window-size\=1920,1080
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    Create Webdriver    Chrome   executable_path=${driver_path}     desired_capabilities=${options}
    Maximize Browser Window
    Go To           ${page}

Open Firefox Browser To Page
    [Arguments]     ${page}     ${driver_path}
    Create Webdriver    Firefox   executable_path=${driver_path}
    Maximize Browser Window
    Go To           ${page}

Open Edge Browser To Page
    [Arguments]     ${page}     ${driver_path}
    Create Webdriver    Edge   executable_path=${driver_path}
    Maximize Browser Window
    Go To           ${page}

Get Driver Path
    ${driver_path}=   helpers.Get Driver Path    ${browser}
    [Return]  ${driver_path}
