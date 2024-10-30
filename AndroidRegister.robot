*** Settings ***
Documentation     Register
Library           AppiumLibrary

*** Variables ***
${URL}                        http://127.0.0.1:4723
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   15  
${ANDROID_APP}                D:\\FinalDua\\app\\build\\outputs\\apk\\debug\\app-debug.apk
${EMAILNEW2}                    icezazaa111@gmail.com
${EMAILNEW1}                    icezazaa222@gmail.com
${USERNAME}                  ICEZING561
${USERNAME2}                 ICEZING562
${PASSWORD}                   ICEZingZ11
${CPASSWORD}                    ICEZingZ11
${FPASSWORD}                        ICEZingZ00
${APP_PACKAGE}                th.ac.rmutto.duangdee
${APP_ACTIVITY}               th.ac.rmutto.duangdee.MainActivity

*** Test Cases ***
Register With Email
    [Documentation]    สมัครข้อมูลแบบอีเมลปกติ
    Open Test Application
    Click Element     id=th.ac.rmutto.duangdee:id/TextRegister_Btn

    # รอให้หน้าสร้างบัญชีของคุณ หน้าที่1
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    # กรอกอีเมล
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisEmail        ${EMAILNEW1}     
    # ติ๊กถูกยอมรับเงื่อนไข
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxAge
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxPolicy
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn

    # รอให้ช่องกรอกชื่อผู้ใช้ปรากฏก่อนที่จะป้อนข้อมูล  หน้าที่2
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisUsername        ${USERNAME}
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisPassword         ${PASSWORD} 
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisConfirmPassword        ${CPASSWORD}
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn

    # รอให้ช่องกดยืนยันเมล  หน้าที่3
    Wait Until Page Contains    ยืนยันบัญชีของคุณ   timeout=10s
    Click Element    id=th.ac.rmutto.duangdee:id/Confirm_Btn

    # รอให้ช่องกรอก OTP  หน้าที่4
    Wait Until Page Contains    กรอกรหัส OTP   timeout=10s
    Sleep         15s         #รอกรอกOTPเอง
    Click Element    id=th.ac.rmutto.duangdee:id/confirmotp_btn

    Wait Until Page Contains    Register WITH  timeout=10s
    Close Application

*** Test Cases ***
Register With Email Error 1
    [Documentation]    สมัครข้อมูลแบบไม่กรอก Email
    Open Test Application
    Click Element     id=th.ac.rmutto.duangdee:id/TextRegister_Btn  
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    # ไม่กร
    Clear Text      id=th.ac.rmutto.duangdee:id/editTextRegisEmail        
    # ติ๊กถูกยอมรับเงื่อนไข
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxAge
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxPolicy
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn
    Wait Until Page Contains    E-mail   timeout=10s

*** Test Cases ***
Register With Email Error 2
    [Documentation]    สมัครข้อมูลแบบไม่กรอกUsername
    Open Test Application
    Click Element     id=th.ac.rmutto.duangdee:id/TextRegister_Btn  
    # รอให้หน้าสร้างบัญชีของคุณ หน้าที่1
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    # กรอกอีเมล
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisEmail       ${EMAILNEW2}     
    # ติ๊กถูกยอมรับเงื่อนไข
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxAge
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxPolicy
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn

    # ไม่กรอกข้อมูล  หน้าที่2
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    Clear Text      id=th.ac.rmutto.duangdee:id/editTextRegisUsername        
    Clear Text      id=th.ac.rmutto.duangdee:id/editTextRegisPassword         
    Clear Text      id=th.ac.rmutto.duangdee:id/editTextRegisConfirmPassword        
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn

    Wait Until Page Contains    Username   timeout=10s

    Close Application

*** Test Cases ***
Register With Email Error 3
    #[Documentation]    สมัครข้อมูลแบบไม่กรอกOTP
    Open Test Application
    Click Element     id=th.ac.rmutto.duangdee:id/TextRegister_Btn

    # รอให้หน้าสร้างบัญชีของคุณ หน้าที่1
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    # กรอกอีเมล
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisEmail       ${EMAILNEW2}     
    # ติ๊กถูกยอมรับเงื่อนไข
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxAge
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxPolicy
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn

    # รอให้ช่องกรอกชื่อผู้ใช้ปรากฏก่อนที่จะป้อนข้อมูล  หน้าที่2  #ยูสเซอร์ไม่เคยมีในระบบ
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisUsername        ${USERNAME2} 
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisPassword         ${PASSWORD} 
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisConfirmPassword        ${CPASSWORD}
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn

    # รอให้ช่องกดยืนยันเมล  หน้าที่3
    Wait Until Page Contains    ยืนยันบัญชีของคุณ   timeout=10s
    Click Element    id=th.ac.rmutto.duangdee:id/Confirm_Btn

    # ไม่กรอก OTP  หน้าที่4
    Wait Until Page Contains    กรอกรหัส OTP   timeout=10s
    Click Element    id=th.ac.rmutto.duangdee:id/confirmotp_btn
    Wait Until Page Contains    กรอกรหัส OTP   timeout=10s
    
    Close Application

*** Test Cases ***
Register With Email Error 4
    #[Documentation]    สมัครข้อมูลแบบไม่กรอกOTP
    Open Test Application
    Click Element     id=th.ac.rmutto.duangdee:id/TextRegister_Btn

    # รอให้หน้าสร้างบัญชีของคุณ หน้าที่1
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    # กรอกอีเมล ยูสเซอร์ไม่เคยมีในระบบ
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisEmail       ${EMAILNEW2}          
    # ติ๊กถูกยอมรับเงื่อนไข
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxAge
    Click Element    id=th.ac.rmutto.duangdee:id/checkBoxPolicy
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn

    # รอให้ช่องกรอกชื่อผู้ใช้ปรากฏก่อนที่จะป้อนข้อมูล  หน้าที่2
    Wait Until Page Contains    สร้างบัญชีของคุณ   timeout=10s
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisUsername        ${USERNAME}
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisPassword         ${PASSWORD} 
    Input Text      id=th.ac.rmutto.duangdee:id/editTextRegisConfirmPassword        ${FPASSWORD}
    Click Element    id=th.ac.rmutto.duangdee:id/Next_Btn

    Wait Until Page Contains   Username   timeout=10s
    Close Application


*** Keywords ***
Open Test Application
    Open Application    ${URL}    automationName=${ANDROID_AUTOMATION_NAME}   platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  app=${ANDROID_APP}   appPackage=${APP_PACKAGE}   appActivity=${APP_ACTIVITY}
