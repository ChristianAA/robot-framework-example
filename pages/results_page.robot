*** Settings ***
Documentation   Results Page Variables and Keywords
Resource        imports.robot

*** Variables ***
${result_links}     css:[data-testid='mainline'] [data-testid='result']

*** Keywords ***
