*** Settings ***
Documentation     Login Test Suite
Library           SeleniumLibrary
 
*** Variables ***
${URL}            http://localhost:3000/
${BROWSER}        chrome
${VALID_USERNAME}    admin
${VALID_PASSWORD}    Cs12345678
${INVALID_USERNAME}    test
${INVALID_PASSWORD}    12345
 
*** Test Cases ***
Valid Login Test
    [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ถูกต้อง
    [tags]             smoke
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s  # หรือใช้ Wait Until Element Is Visible
    Wait Until Page Contains     Users in System   timeout=10s
    Close Browser
       
Invalid Login Test
    [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ไม่ถูกต้อง
    [tags]                
    Open Browser       ${URL}    ${BROWSER}
    Input Text         id=username      ${INVALID_USERNAME}
    Input Text         id=password      ${INVALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s  # รอให้หน้าโหลด
    Wait Until Page Contains     ไม่พบบัญชีผู้ใช้นี้   timeout=10s
    Close Browser
