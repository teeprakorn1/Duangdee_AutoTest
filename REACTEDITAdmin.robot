*** Settings ***
Documentation     เทสหน้าแอดมิน
Library           SeleniumLibrary

*** Variables ***
${URL}            https://duangdee-app.com/
${BROWSER}        chrome
${VALID_USERNAME}    admin
${VALID_PASSWORD}     Cs12345678
${EMAIL}          DEKFUNDY7@gmail.com
${USERNAME}          DEKFUNDY888
${DISNAME}          DEKFU58
${PASSWORD}          DEKFUNDY5
${CPASSWORD}         DEKFUNDY5
${FAILPASSWORD}          DEKFUNDY1


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

*** Test Cases ***
ADD ADMIN DATA TRUE 
    [Documentation]    ทดสอบเพิ่มแอดมินโดยกรอกข้อมูลถูกต้อง
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/add-admin']
    Click Element      xpath://*[@href='/add-admin']
    Wait Until Page Contains         เพิ่ม Admin

    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=usersEmail    10s
    Input Text                       name=usersEmail    ${EMAIL}
    Wait Until Element Is Visible    name=usersUsername    10s
    Input Text         name=usersUsername      ${USERNAME}
    Wait Until Element Is Visible    name=usersDisplayName    10s
    Input Text         name=usersDisplayName          ${DISNAME} 
    Wait Until Element Is Visible    name=usersPassword    10s
    Input Text         name=usersPassword          ${PASSWORD} 
    Wait Until Element Is Visible    name=confirmPassword    10s
    Input Text         name=confirmPassword          ${CPASSWORD}

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='ลงทะเบียน Admin']
    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='ลงทะเบียน Admin']
    Wait Until Page Contains     ลงทะเบียน Admin สำเร็จเรียบร้อยแล้ว
    Close Browser

*** Test Cases ***
ADD ADMIN DATA FAIL 
    [Documentation]    ทดสอบการเพิ่มแอดมินโดยรหัสผ่านผิด
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/add-admin']
    Click Element      xpath://*[@href='/add-admin']
    Wait Until Page Contains         เพิ่ม Admin

    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=usersEmail    10s
    Input Text                       name=usersEmail     ${EMAIL}
    Wait Until Element Is Visible    name=usersUsername    10s
    Input Text         name=usersUsername       ${USERNAME}
    Wait Until Element Is Visible    name=usersDisplayName    10s
    Input Text         name=usersDisplayName          ${DISNAME} 
    Wait Until Element Is Visible    name=usersPassword    10s
    Input Text         name=usersPassword          ${PASSWORD}   
    Wait Until Element Is Visible    name=confirmPassword    10s
    Input Text         name=confirmPassword          ${FAILPASSWORD}   # กรอกรหัสผ่านไม่เหมือนกัน

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='ลงทะเบียน Admin']
    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='ลงทะเบียน Admin']

    # ตรวจสอบว่ามีข้อความแจ้งเตือนข้อผิดพลาด
    Wait Until Page Contains     รหัสผ่านไม่ตรงกัน    10s
    Close Browser

*** Test Cases ***
ADD ADMIN DATA FAIL HAVE DATA IN SYSTEM
    [Documentation]    ทดสอบเพิ่มแอดมินโดยกรอกข้อมูลที่สมัครไปแล้วใน TESTCASE 1 
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/add-admin']
    Click Element      xpath://*[@href='/add-admin']
    Wait Until Page Contains         เพิ่ม Admin

    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=usersEmail    10s
    Input Text                       name=usersEmail    ${EMAIL}
    Wait Until Element Is Visible    name=usersUsername    10s
    Input Text         name=usersUsername      ${USERNAME}
    Wait Until Element Is Visible    name=usersDisplayName    10s
    Input Text         name=usersDisplayName          ${DISNAME} 
    Wait Until Element Is Visible    name=usersPassword    10s
    Input Text         name=usersPassword          ${PASSWORD} 
    Wait Until Element Is Visible    name=confirmPassword    10s
    Input Text         name=confirmPassword          ${CPASSWORD}

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='ลงทะเบียน Admin']
    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='ลงทะเบียน Admin']
    Wait Until Page Contains    มีชื่อผู้ใช้นี้อยู่ในระบบอยู่แล้ว    20s
    Close Browser