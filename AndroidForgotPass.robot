*** Settings ***
Documentation     ForgotPass
Library           AppiumLibrary

*** Variables ***
${URL}                        http://127.0.0.1:4723
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   15  
${ANDROID_APP}                D:\\FinalDua\\app\\build\\outputs\\apk\\debug\\app-debug.apk
${EMAIL}                      icezazaa222@gmail.com
${NEWPASS}                    IceZ1234
${NEWPASS1}                   IceZ1234
${WPASS}                      vimrer34
${APP_PACKAGE}                th.ac.rmutto.duangdee
${APP_ACTIVITY}               th.ac.rmutto.duangdee.MainActivity

*** Test Cases ***
 OTP Confirmation Test
    [Documentation]   รีเซ็ตรหัสผ่านใหม่โดยกรอกทุกอย่างถูกต้อง
    Open Test Application
    Click Element  id=th.ac.rmutto.duangdee:id/TextForgotPassword_Btn 
    
    #รอหน้ารีเซ็ตรหัสผ่านใหม่
    Wait Until Page Contains    รีเซ็ตรหัสผ่านใหม่   timeout=10s
    Input Text    id=th.ac.rmutto.duangdee:id/editText_EmailAddress   ${EMAIL}  
    Click Element    id=th.ac.rmutto.duangdee:id/SendEmail_btn

    #รอหน้ายืนยันบัญชี
    Wait Until Page Contains    ยืนยันบัญชีของคุณ   timeout=10s
    Click Element    id=th.ac.rmutto.duangdee:id/Confirm_Btn

    #รอหน้าOTP กรอก OTP เอง 
    Wait Until Page Contains   กรอกรหัส OTP  timeout=10s
    Sleep         15s
    Click Element    id=th.ac.rmutto.duangdee:id/confirmotp_btn

    #รอหน้ารีรหัสผ่าน
    Wait Until Page Contains   ตั้งค่ารหัสผ่านใหม่  timeout=10s
    Input Text    id=th.ac.rmutto.duangdee:id/editText_Password      ${NEWPASS}
    Input Text    id=th.ac.rmutto.duangdee:id/editText_confirmPassword            ${NEWPASS1}
    Click Element    id=th.ac.rmutto.duangdee:id/Confirm_Password_Btn

    Wait Until Page Contains   Register WITH  timeout=10s
    Close Application

Invalid OTP Confirmation Test
    [Documentation]   รีเซ็ตรหัสผ่านใหม่โดยไม่ยืนยัน OTP
    Open Test Application
    Click Element  id=th.ac.rmutto.duangdee:id/TextForgotPassword_Btn 
    
    #รอหน้ารีเซ็ตรหัสผ่านใหม่
    Wait Until Page Contains    รีเซ็ตรหัสผ่านใหม่   timeout=10s
    Input Text    id=th.ac.rmutto.duangdee:id/editText_EmailAddress   ${EMAIL}  
    Click Element    id=th.ac.rmutto.duangdee:id/SendEmail_btn

    #รอหน้ายืนยันบัญชี
    Wait Until Page Contains    ยืนยันบัญชีของคุณ   timeout=10s
    Click Element    id=th.ac.rmutto.duangdee:id/Confirm_Btn

    #รอหน้าOTP 
    Wait Until Page Contains   กรอกรหัส OTP  timeout=10s

    # ไม่กรอก OTP และกดปุ่มยืนยัน OTP 
    Click Element    id=th.ac.rmutto.duangdee:id/confirmotp_btn

    # ตรวจสอบว่ามีข้อความแสดงข้อผิดพลาด หรือกลับมาที่หน้ากรอก OTP
    Wait Until Page Contains   กรอกรหัส OTP  timeout=5s  # ข้อความแจ้งเตือนปรับตามที่ระบบแสดง

    Close Application

 Mismatched Confirm Password Test
    [Documentation]   ตรวจสอบการรีเซ็ตรหัสผ่านใหม่เมื่อรหัสผ่านยืนยันไม่ตรงกัน
    Open Test Application
    Click Element  id=th.ac.rmutto.duangdee:id/TextForgotPassword_Btn 

    # รอหน้ารีเซ็ตรหัสผ่านใหม่
    Wait Until Page Contains    รีเซ็ตรหัสผ่านใหม่   timeout=10s
    Input Text    id=th.ac.rmutto.duangdee:id/editText_EmailAddress   ${EMAIL}  
    Click Element    id=th.ac.rmutto.duangdee:id/SendEmail_btn

    # รอหน้ายืนยันบัญชี
    Wait Until Page Contains    ยืนยันบัญชีของคุณ   timeout=10s
    Click Element    id=th.ac.rmutto.duangdee:id/Confirm_Btn

    # รอหน้าOTP กรอก OTP เอง 
    Wait Until Page Contains   กรอกรหัส OTP  timeout=10s
    Sleep         15s
    Click Element    id=th.ac.rmutto.duangdee:id/confirmotp_btn

    # รอหน้ารีเซ็ตรหัสผ่านใหม่
    Wait Until Page Contains   ตั้งค่ารหัสผ่านใหม่  timeout=10s
    Input Text    id=th.ac.rmutto.duangdee:id/editText_Password      ${NEWPASS}
    Input Text    id=th.ac.rmutto.duangdee:id/editText_confirmPassword    ${WPASS}  # ตั้งค่ารหัสผ่านยืนยันไม่ตรงกับรหัสผ่านใหม่
    Click Element    id=th.ac.rmutto.duangdee:id/Confirm_Password_Btn

    # ตรวจสอบว่ามีข้อความแสดงข้อผิดพลาดหรือยังอยู่ในหน้าตั้งค่ารหัสผ่านใหม่
    Wait Until Page Contains   ตั้งค่ารหัสผ่านใหม่  timeout=5s  # ตรวจสอบข้อความแจ้งเตือนหรือข้อผิดพลาดตามที่ระบบแสดง

    Close Application



*** Keywords ***
Open Test Application
    Open Application    ${URL}    automationName=${ANDROID_AUTOMATION_NAME}   platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  app=${ANDROID_APP}   appPackage=${APP_PACKAGE}   appActivity=${APP_ACTIVITY}
