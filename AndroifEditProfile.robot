*** Settings ***
Documentation     Login Test Suite
Library           AppiumLibrary

*** Variables ***
${URL}                        http://127.0.0.1:4723
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   15  
${ANDROID_APP}                D:\\TESTAND\\app\\build\\outputs\\apk\\debug\\app-debug.apk
${VALID_USERNAME}             admin
${VALID_PASSWORD}             Cs12345678
${NEW_DN}                     Rasswin
${NEW_N}                      134354443
${NEW_SN}                     YEAfseg              
${NEW_PH}                     0945465654
${APP_PACKAGE}                th.ac.rmutto.duangdee
${APP_ACTIVITY}               th.ac.rmutto.duangdee.MainActivity
${DATE_PICKER_ID}             id=th.ac.rmutto.duangdee:id/imageButton  
${DAY}                        4
${MONTH}                      November
${YEAR}                       2023

*** Test Cases ***
Valid Login Test
    [Documentation]    แก้ไขโปรไฟล์
    Open Test Application
    Input Text        id=th.ac.rmutto.duangdee:id/editTextUsername    ${VALID_USERNAME} 
    Input Text        id=th.ac.rmutto.duangdee:id/editTextPassword    ${VALID_PASSWORD}
    Click Element     id=th.ac.rmutto.duangdee:id/ButtonLogin 
    Log    "กำลังรอให้หน้าหลักปรากฏ..."
    Wait Until Page Contains    DuangDee   timeout=10s
    Log    "หน้าหลักปรากฏหลังจากเข้าสู่ระบบสำเร็จ."
    
    Click Element   id=th.ac.rmutto.duangdee:id/navigation_profile
    Click Element   id=th.ac.rmutto.duangdee:id/btnEdit
    Log    "กำลังรอให้หน้า Edit Profile ปรากฏ..."
    Wait Until Element Is Visible   id=th.ac.rmutto.duangdee:id/EditProfile_Activity   timeout=30s
    
    Clear Text      id=th.ac.rmutto.duangdee:id/editTextRegisName
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisName    ${NEW_DN}  

    Clear Text      id=th.ac.rmutto.duangdee:id/editText_FirstName
    Input Text      id=th.ac.rmutto.duangdee:id/editText_FirstName   ${NEW_N} 

    Clear Text      id=th.ac.rmutto.duangdee:id/editTextRegisSurname
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisSurname   ${NEW_SN} 

    Click Element   ${DATE_PICKER_ID}   # เปิด Date Picker

    # คลิกเลือกปี
    Click Element   xpath=//*[@resource-id='android:id/date_picker_header_year']
    Click Element   xpath=//*[@text='${YEAR}']

    # คลิกเลือกวันที่
    Click Element   xpath=//*[contains(@text, '${DAY}')] 

    # ยืนยันการเลือก
    Click Element   xpath=//*[@text='OK']

    Click Element   id=th.ac.rmutto.duangdee:id/spinner
    Log    "กำลังเลือกเพศใน dropdown"
    Click Element   xpath=//*[@text='ผู้หญิง']

    Clear Text      id=th.ac.rmutto.duangdee:id/editText_Phone
    Input Text      id=th.ac.rmutto.duangdee:id/editText_Phone   ${NEW_PH} 
    
    Click Element   id=th.ac.rmutto.duangdee:id/Save_Btn

Test Incomplete Form Submission
    [Documentation]    ทดสอบการกรอกข้อมูลไม่ครบถ้วน
    Open Test Application
    Input Text        id=th.ac.rmutto.duangdee:id/editTextUsername    ${VALID_USERNAME} 
    Input Text        id=th.ac.rmutto.duangdee:id/editTextPassword    ${VALID_PASSWORD}
    Click Element     id=th.ac.rmutto.duangdee:id/ButtonLogin 
    Log    "กำลังรอให้หน้าหลักปรากฏ..."
    Wait Until Page Contains    DuangDee   timeout=10s
    Log    "หน้าหลักปรากฏหลังจากเข้าสู่ระบบสำเร็จ."
    
    Click Element   id=th.ac.rmutto.duangdee:id/navigation_profile
    Click Element   id=th.ac.rmutto.duangdee:id/btnEdit
    Log    "กำลังรอให้หน้า Edit Profile ปรากฏ..."
    Wait Until Element Is Visible   id=th.ac.rmutto.duangdee:id/EditProfile_Activity   timeout=30s
    
    Clear Text      id=th.ac.rmutto.duangdee:id/editTextRegisName
    # ไม่กรอกชื่อเล่น เพื่อจำลองการกรอกข้อมูลไม่ครบ

    Clear Text      id=th.ac.rmutto.duangdee:id/editText_FirstName
    Input Text      id=th.ac.rmutto.duangdee:id/editText_FirstName   ${NEW_N} 

    Clear Text      id=th.ac.rmutto.duangdee:id/editTextRegisSurname
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisSurname   ${NEW_SN} 

    Click Element   ${DATE_PICKER_ID}   # เปิด Date Picker

    # คลิกเลือกปี
    Click Element   xpath=//*[@resource-id='android:id/date_picker_header_year']
    Click Element   xpath=//*[@text='${YEAR}']

    # คลิกเลือกวันที่
    Click Element   xpath=//*[contains(@text, '${DAY}')] 

    # ยืนยันการเลือก
    Click Element   xpath=//*[@text='OK']

    Click Element   id=th.ac.rmutto.duangdee:id/spinner
    Log    "กำลังเลือกเพศใน dropdown"
    Click Element   xpath=//*[@text='ผู้หญิง']

    Clear Text      id=th.ac.rmutto.duangdee:id/editText_Phone
    Input Text      id=th.ac.rmutto.duangdee:id/editText_Phone   ${NEW_PH} 
    
    Click Element   id=th.ac.rmutto.duangdee:id/Save_Btn

    Wait Until Page Contains    แก้ไขบัญชีของคุณ   timeout=10s
    Log    "การแจ้งเตือนแสดงข้อความกรอกข้อมูลไม่ครบถ้วนสำเร็จ"


*** Keywords ***
Open Test Application
    Open Application    ${URL}    automationName=${ANDROID_AUTOMATION_NAME}   platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  app=${ANDROID_APP}   appPackage=${APP_PACKAGE}   appActivity=${APP_ACTIVITY}
    Wait Until Page Loaded

Wait Until Page Loaded 
    Wait Until Element Is Visible  id=th.ac.rmutto.duangdee:id/Login_Activity   timeout=30s