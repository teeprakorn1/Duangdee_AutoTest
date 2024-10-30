*** Settings ***
Documentation     Test Suite สำหรับการแก้ไขข้อมูลผู้ใช้แถวแรก
Library           SeleniumLibrary

*** Variables ***
${URL}            https://duangdee-app.com/
${BROWSER}        chrome
${VALID_USERNAME}    admin
${VALID_PASSWORD}     Cs12345678
${IMAGE_PATH}     C:\\Users\\ICEZING\\Downloads\\222.jpg  # ใส่พาธของไฟล์รูปภาพที่ต้องการอัปโหลด
${DisName}          DEKFUNDY
${FirstName}          DEKFUNDY
${LastName}          DEKFUNDY
${Phone}          0912200902                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
${EMPTY} 

*** Test Cases ***
Edit First User Information Test
    [Documentation]    ทดสอบการคลิกปุ่ม Edit ที่แถวแรกในตารางผู้ใช้
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/customer']
    Click Element      xpath://*[@href='/customer']
    Wait Until Element Is Visible    xpath://table//tr[1]//button[text()='Edit']
    Click Element      xpath://table//tr[1]//button[text()='Edit']
    Wait Until Page Contains         แก้ไขข้อมูลผู้ใช้

    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=Users_DisplayName    10s
    Input Text         name=Users_DisplayName    ${DisName} 
    Wait Until Element Is Visible    name=Users_FirstName    10s
    Input Text         name=Users_FirstName      ${FirstName} 
    Wait Until Element Is Visible    name=Users_LastName    10s
    Input Text         name=Users_LastName       ${LastName}
    Wait Until Element Is Visible    name=Users_Phone    10s
    Input Text         name=Users_Phone         ${Phone}

    # อัปโหลดไฟล์รูปภาพโดยใช้ XPath
    Choose File        xpath=//input[@type='file']          ${IMAGE_PATH}

    # เลือกค่า Dropdown สำหรับ Gender
    Select From List By Label    name=UsersGender_ID    MALE

    # เลือกค่า Is Active
    Select From List By Label    name=Users_IsActive    Active

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']

    # จัดการกับ Alert ที่ปรากฏ
    Handle Alert    ACCEPT

    # ตรวจสอบว่าการบันทึกสำเร็จ
    Wait Until Page Contains     รายการผู้ใช้

    Close Browser


*** Test Cases ***
Edit First User Information Test With Missing Data
    [Documentation]    ทดสอบการแก้ไขข้อมูลผู้ใช้ โดยกรอกข้อมูลไม่ครบ
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/customer']
    Click Element      xpath://*[@href='/customer']
    Wait Until Element Is Visible    xpath=//table//tr[1]//button[text()='Edit']
    Click Element      xpath=//table//tr[1]//button[text()='Edit']
    Wait Until Page Contains         แก้ไขข้อมูลผู้ใช้

    # แก้ไขข้อมูลในฟอร์ม 
    Wait Until Element Is Visible    name=Users_DisplayName    10s
    Input Text         name=Users_DisplayName   ${DisName}   # กรอก DisplayName
    
    # แก้ไขข้อมูลในฟอร์ม โดยเว้นฟิลด์ที่เป็น Required ไว้
    Wait Until Element Is Visible    name=Users_FirstName    10s
    Input Text         name=Users_FirstName      ${EMPTY}  # ไม่กรอก FirstName เพื่อจำลองการกรอกข้อมูลไม่ครบ
    
    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    Wait Until Page Contains         แก้ไขข้อมูลผู้ใช้

    Close Browser
