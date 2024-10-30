*** Settings ***
Documentation     Login Test Suite
Library           AppiumLibrary

*** Variables ***
${URL}                        http://127.0.0.1:4723
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   15  
${ANDROID_APP}                D:\\FinalDua\\app\\build\\outputs\\apk\\debug\\app-debug.apk
${VALID_USERNAME}             admin
${VALID_PASSWORD}             Cs12345678
${INVALID_USERNAME}           test
${INVALID_PASSWORD}           1234
${APP_PACKAGE}                th.ac.rmutto.duangdee
${APP_ACTIVITY}               th.ac.rmutto.duangdee.MainActivity

*** Test Cases ***
Valid Login Test
    [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ถูกต้อง
    Open Test Application
    Input Text        id=th.ac.rmutto.duangdee:id/editTextUsername    ${VALID_USERNAME} 
    Input Text        id=th.ac.rmutto.duangdee:id/editTextPassword    ${VALID_PASSWORD}
    Click Element     id=th.ac.rmutto.duangdee:id/ButtonLogin 
    Wait Until Page Contains    DuangDee   timeout=10s

    Click Element   id=th.ac.rmutto.duangdee:id/navigation_profile
    Click Element   id=th.ac.rmutto.duangdee:id/imageProfile
    
    Wait Until Element Is Visible    //android.widget.TextView[@text='Gallery']
    Click Element    //android.widget.TextView[@text='Gallery']

    # รอจนกระทั่งภาพแรกพร้อมให้เลือก
    Wait Until Element Is Visible   xpath=(//android.widget.ImageView)[1]   timeout=5s
    Click Element   xpath=(//android.widget.ImageView)[1]

    # กดยืนยันรูปภาพ (ติ๊กถูก)
    Wait Until Element Is Visible    xpath=//android.widget.ImageView[@content-desc='Save']
    Click Element    xpath=//android.widget.ImageView[@content-desc='Save']


*** Keywords ***
Open Test Application
    Open Application    ${URL}    automationName=${ANDROID_AUTOMATION_NAME}   platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  app=${ANDROID_APP}   appPackage=${APP_PACKAGE}   appActivity=${APP_ACTIVITY}
