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
    Log    "กำลังรอให้หน้าหลักปรากฏ..."
    Wait Until Page Contains    DuangDee   timeout=10s   #ข้อความหลังล็อคอินเสร็จ
    Log    "หน้าหลักปรากฏหลังจากเข้าสู่ระบบสำเร็จ."
    Close Application

Invalid Login Test
    [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ไม่ถูกต้อง
    Open Test Application
    Input Text        id=th.ac.rmutto.duangdee:id/editTextUsername    ${INVALID_USERNAME} 
    Input Text        id=th.ac.rmutto.duangdee:id/editTextPassword    ${INVALID_PASSWORD}
    Click Element     id=th.ac.rmutto.duangdee:id/ButtonLogin    
    Log    "กำลังรอให้หน้าล็อกอินปรากฏ..."
    Wait Until Element Is Visible   id=th.ac.rmutto.duangdee:id/Login_Activity   timeout=30s
    Log    "เข้าสู่ระบบไม่สำเร็จ."
    Close Application

*** Keywords ***
Open Test Application
    Open Application    ${URL}    automationName=${ANDROID_AUTOMATION_NAME}   platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  app=${ANDROID_APP}   appPackage=${APP_PACKAGE}   appActivity=${APP_ACTIVITY}
    Wait Until Page Loaded

Wait Until Page Loaded 
    Wait Until Element Is Visible  id=th.ac.rmutto.duangdee:id/Login_Activity   timeout=30s
