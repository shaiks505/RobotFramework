*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}    Chrome
${URL}    https://www.flipkart.com/

*** Test Cases ***
AddCartTest
    Open Browser  ${URL}  ${Browser}  alias
    Maximize Browser Window
    Click Button  xpath://button[contains(text(),'✕')]
    Set Selenium Speed  0.75 seconds
    Mouse Over  xpath://span[contains(text(),'Electronics')]
    Click Link  xpath://a[@title='Realme']
    Set Selenium Implicit Wait  10 seconds
    Scroll Element Into View  xpath://div[contains(text(),'Realme 6 (Comet White, 64 GB)')]
    Click Element  xpath://div[contains(text(),'Realme 6 (Comet White, 64 GB)')]
    Set Selenium Implicit Wait  10 seconds
    Switch Window  locator=NEW
    Click Button  xpath://button[@class='_2AkmmA _2Npkh4 _2MWPVK']
    Wait Until Page Contains  Realme 6
    ${mobileName}=  Get Element Attribute  xpath://a[@class='_325-ji _3ROAwx']  text
    log to console  ${mobileName}
    log to console  'PASS'

GotoCartTest
    Open Browser  ${URL}  ${Browser}  alias
    Set Selenium Implicit Wait  10 seconds
    Click Link  xpath://*[@id='container']/div/div[1]/div[1]/div[2]/div[5]/div/div/a
    Wait Until Page Contains  Realme 6
    ${mobileName2}=  Get Element Attribute  xpath://a[@class='_325-ji _3ROAwx']  text
    log to console  ${mobileName2}
    Should Be Equal As Strings  ${mobileName2}  Realme 6 (Comet White, 64 GB)
    log to console  'PASS'
    Close Browser

*** Keywords ***


