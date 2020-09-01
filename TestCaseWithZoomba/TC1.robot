*** Settings ***
Library          Zoomba.MobileLibrary

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${AUTOMATION_NAME}      UiAutomator2
${DEVICE_NAME}          168610e17d63
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     6.0
${APP_PACKAGE}          com.flipkart.android
${APP_ACTIVITY}         com.flipkart.android.activity.HomeFragmentHolderActivity
${RESET}                true
${MOBILE_NAME}          Realme X50 Pro 5G (Rust Red, 256 GB) (12 GB RAM)

*** Test Cases ***
AddCartTest
    Start App
    Wait For And Click Element  com.flipkart.android:id/search_widget_textbox
    Input Text  com.flipkart.android:id/search_autoCompleteTextView   Realme 5
    Click Element At Coordinates  660  1210      #Clicks Search button on keyboard
    Scroll Down To Text  ${MOBILE_NAME}
    Page Should Contain Text  ${MOBILE_NAME}
    Click Text  ${MOBILE_NAME}
    Page Should Contain Text  ${MOBILE_NAME}
    Click Element At Coordinates  179  1221       #Clicks ADD TO CART button


GoToCartTest
    Start App
    Wait For And Click Element  com.flipkart.android:id/cart_bg_icon
    Page Should Contain Text  ${MOBILE_NAME}
    ${mobileName}=  Get Element Attribute  //android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView[1]  text
    log to console  ${mobileName}
    Should Be Equal As Strings  ${mobileName}  ${MOBILE_NAME}



*** Keywords ***
Start App
       Open Application    ${REMOTE_URL}     platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}
       ...  deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
       ...  noReset=${RESET}