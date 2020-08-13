*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}    Chrome
${URL}    https://www.flipkart.com/

*** Test Cases ***
AddCartTest
    launchBrowser  ${URL}  ${Browser}
    Click Button  xpath://button[contains(text(),'✕')]
    Set Selenium Implicit Wait  5 seconds
    Mouse Over  xpath://span[contains(text(),'Electronics')]
    Click Link  xpath://a[@title='Realme']
    Set Selenium Implicit Wait  5 seconds
    Input Text  name:q  Realme x
    Press Keys  name:q  ENTER
    Set Selenium Implicit Wait  10 seconds
    Scroll Element Into View  xpath://a[@title='Realme X2 (Pearl Green, 128 GB)']
    Set Selenium Implicit Wait  5 seconds
    Click link  xpath://a[@title='Realme X2 (Pearl Green, 128 GB)']
    Set Selenium Implicit Wait  10 seconds
    Switch Window  locator=NEW
    Set Selenium Speed  1 seconds
    Click Button  xpath://button[@class='_2AkmmA _2Npkh4 _2MWPVK']
    Set Selenium Implicit Wait  10 seconds
    ${mobileName}=  Get Element Attribute  xpath://a[@class='_325-ji _3ROAwx']  text
    log to console  ${mobileName}
    log to console  'PASS'

GotoCartTest
    launchBrowser  ${URL}  ${Browser}
    Set Selenium Implicit Wait  10 seconds
    Click Link  xpath://*[@id='container']/div/div[1]/div[1]/div[2]/div[5]/div/div/a
    Wait Until Page Contains  Realme X2
    ${mobileName2}=  Get Element Attribute  xpath://a[@class='_325-ji _3ROAwx']  text
    log to console  ${mobileName2}
    Should Be Equal As Strings  ${mobileName2}  Realme X2 (Pearl Green, 128 GB)
    log to console  'PASS'
    Close Browser

*** Keywords ***
launchBrowser
    [Arguments]  ${appurl}  ${appbrowser}
    Open Browser  ${appurl}  ${appbrowser}  alias
    Maximize Browser Window
