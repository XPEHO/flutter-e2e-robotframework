*** Settings ***
Documentation       TODO
Library  AppiumLibrary
Library  OCRLibrary
Library  Collections
Library  custom_lib.py

*** Variables ***
${APP}      com.example.flutter_tests
${IMAGE_DIR}      ${CURDIR}/images
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${IOS_PLATFORM_NAME}        iOS
${ANDROID_PLATFORM_NAME}      Android

*** Keywords ***

Open The counter app
    Open Application  http://192.168.1.32:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
      ...  platformName=${ANDROID_PLATFORM_NAME}
      ...  appPackage=com.example.flutter_tests  appActivity=com.example.flutter_tests.MainActivity
      #...   app=${CURDIR}/../../build/app/outputs/flutter-apk/app-debug.apk


Close The counter app
    Close Application


Given I have opened the counter app
    Find Text       You have pushed the button this many times:
    Find Text       0


When I click on the increment button
    [Arguments]     ${clickCount}
    Click Image       plus_button.png       ${clickCount}


Then the counter should incremented by 
    [Arguments]     ${clickCount}
    Find Text        ${clickCount}


When I click on the drawer menu icon
    Click Image       menu_icon.png
    Sleep               2


And I click on the about item
    Click On Text       About


Then the about dialog should be shown
    Find Text   (c) 2020 The Flutter Authors
    Find Text   MIT License


When I click on the dash icon
    Click Image       dash_icon.png
    Sleep               2


Then the reset counter button should be displayed
    Find Image       reset_button.png


When I click on the reset counter button
    Click Image       reset_button.png
    Sleep               2


And I click on the calculate icon
    Click Image     calculate_icon.png
    Sleep               2


Click On Text
    [Arguments]    ${text}
    ${img_path}=    Capture Page Screenshot         screenshots/screenshot.png
    ${img}=    Process Screen Image     ${img_path}
    @{multiplePoints}     Locate Multiple Text Coordinates       ${img}      ${text}    --psm 11
    Assert Text Was Found     ${multiplePoints}     ${text}
    ${point}=   Get From List    ${multiplePoints}  0
    Tap Point     ${point}[0]    ${point}[1]


Find Text
    [Arguments]    ${text}
    Get Screen Text Content
    ${img_path}=    Capture Page Screenshot         screenshots/screenshot.png
    ${img}=    Process Screen Image     ${img_path}
    Validate Image Content      ${img}      ${text}   --psm 11


Find Image
    [Arguments]    ${imagePath}     ${clickCount}=1
    ${img_path}=    Capture Page Screenshot     screenshots/screenshot.png
    ${points}     Find Sub Image    ${IMAGE_DIR}/${imagePath}   ${img_path}
    Should Not Be Empty     ${points}
 

Get Screen Text Content
    ${img_path}=    Capture Page Screenshot         screenshots/screenshot.png
    ${img}=    Process Screen Image     ${img_path}
    ${content}=   Get Image Content   ${img}
    Log Variables


Click Image
    [Arguments]    ${imagePath}     ${clickCount}=1
    ${img_path}=    Capture Page Screenshot     screenshots/screenshot.png
    ${points}     Find Sub Image    ${IMAGE_DIR}/${imagePath}   ${img_path}
    WHILE   ${clickCount} > 0
        Tap Point     ${points}[0]    ${points}[1]
        ${clickCount}=    Evaluate    ${clickCount} - 1
    END

Process Screen Image
    [Arguments]    ${imagePath}
    ${img_path}=    Capture Page Screenshot         screenshots/screenshot.png
    ${processed_img}=     Read Image  ${img_path}
    ${kernel}=    Create List    1    5
    ${img}=    Apply Gaussian Blur To Image    ${processed_img}    ${kernel}
    Save Image      ${img}      screenshots/processed_image.png    
    [Return]       ${img}

Tap Point
    [Arguments]    ${x}  ${y}
    Execute Adb Shell   input tap  ${x}  ${y}


Input Text
    [Arguments]    ${text}
    Execute Adb Shell       input text "${text}"