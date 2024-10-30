*** Settings ***
Documentation     Test Suite สำหรับการแก้ไขข้อมูลไพ่ทาโร่แถวแรกในตาราง
Library           SeleniumLibrary

*** Variables ***
${URL}            https://duangdee-app.com/
${BROWSER}        chrome
${VALID_USERNAME}    admin
${VALID_PASSWORD}     Cs12345678
${IMAGE_PATH}     C:\\Users\\ICEZING\\Downloads\\222.jpg  # ใส่พาธของไฟล์รูปภาพที่ต้องการอัปโหลด
${CardName}          WONDERFUL
${WorkTopic}         การงานดีแบบฉ่ำ
${FinanceTopic}      การเงินปานกลาง
${LoveTopic}         ความรักไม่ดี
${WorkScore}          54
${FinanceScore}       33
${LoveScore}          78                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
${EMPTY} 

*** Test Cases ***
Edit First Tarot Information Test
    [Documentation]    ทดสอบการคลิกปุ่ม Edit ที่แถวแรกในตารางข้อมูลไพ่ทาโร้
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/tarot']
    Click Element      xpath://*[@href='/tarot']
    Wait Until Element Is Visible    xpath://table//tr[1]//button[text()='Edit']
    Click Element      xpath://table//tr[1]//button[text()='Edit']
    Wait Until Page Contains         Edit Tarot Card

    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=cardName    10s
    Input Text                       name=cardName    ${CardName}
    Wait Until Element Is Visible    name=cardWorkTopic    10s
    Input Text         name=cardWorkTopic      ${WorkTopic}
    Wait Until Element Is Visible    name=cardFinanceTopic    10s
    Input Text         name=cardFinanceTopic        ${FinanceTopic} 
    Wait Until Element Is Visible    name=cardLoveTopic    10s
    Input Text         name=cardLoveTopic          ${LoveTopic}  
    Wait Until Element Is Visible    name=cardWorkScore    10s
    Input Text         name=cardWorkScore        ${WorkScore}  
    Wait Until Element Is Visible    name=cardFinanceScore    10s
    Input Text         name=cardFinanceScore       ${FinanceScore}
    Wait Until Element Is Visible    name=cardLoveScore    10s
    Input Text         name=cardLoveScore         ${LoveScore} 

    # อัปโหลดไฟล์รูปภาพโดยใช้ XPath
     Choose File        xpath=//input[@type='file']          ${IMAGE_PATH}  # ระบุพาธไฟล์รูปภาพ
    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    # จัดการกับ Alert ที่ปรากฏ
    Handle Alert    ACCEPT
    Wait Until Page Contains     รายการไพ่ Tarot
    Close Browser


*** Test Cases ***
Edit First Tarot Information Test With Missing Data
    [Documentation]    ทดสอบการคลิกปุ่ม Edit ที่แถวแรกในตารางข้อมูลไพ่ทาโร่ โดยกรอกข้อมูลไม่ครบ
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/tarot']
    Click Element      xpath://*[@href='/tarot']
    Wait Until Element Is Visible    xpath://table//tr[1]//button[text()='Edit']
    Click Element      xpath://table//tr[1]//button[text()='Edit']
    Wait Until Page Contains         Edit Tarot Card

    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=cardName    10s
    Input Text                       name=cardName    ${CardName}
    Wait Until Element Is Visible    name=cardWorkTopic    10s
    Input Text         name=cardWorkTopic      ${WorkTopic}

    # แก้ไขข้อมูลในฟอร์ม โดยเว้นฟิลด์ที่เป็น Required ไว้
    Wait Until Element Is Visible    name=cardFinanceTopic    10s
    Input Text         name=cardFinanceTopic       ${EMPTY}  

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']

    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    Wait Until Page Contains         แก้ไขข้อมูลไพ่ทาโร่


