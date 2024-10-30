*** Settings ***
Documentation     Test Suite สำหรับการแก้ไขข้อมูลผู้ใช้แถวแรก
Library           SeleniumLibrary

*** Variables ***
${URL}            https://duangdee-app.com/
${BROWSER}        chrome
${VALID_USERNAME}    admin
${VALID_PASSWORD}     Cs12345678
${IMAGE_PATH}     C:\\Users\\ICEZING\\Downloads\\222.jpg  # ใส่พาธของไฟล์รูปภาพที่ต้องการอัปโหลด
${WorkTopic}          การงานดี
${FinanceTopic}       การเงินดี
${LoveTopic}          ความรักดี
${ZodiacScore}        50
${EMPTY} 

*** Test Cases ***
Edit First Zodiac Information Test
    [Documentation]    ทดสอบการ Edit ราศีที่แถวแรกในตารางโดยกรอกข้อมูลครบถ้วน
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/zodiac']
    Click Element      xpath://*[@href='/zodiac']
    Wait Until Element Is Visible    xpath=//table//tr[1]//button[text()='Edit']
    Click Element      xpath=//table//tr[1]//button[text()='Edit']
    Wait Until Page Contains         แก้ไขข้อมูลราศี    
    
    Sleep   3s  # รอ 3 วินาที เพื่อรอหน้าข้อมูลโหลด

    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=Zodiac_WorkTopic   10s
    Input Text         name=Zodiac_WorkTopic       ${WorkTopic}  
    Wait Until Element Is Visible    name=Zodiac_FinanceTopic  10s
    Input Text         name=Zodiac_FinanceTopic       ${FinanceTopic} 
    Wait Until Element Is Visible    name=Zodiac_LoveTopic    10s
    Input Text         name=Zodiac_LoveTopic          ${LoveTopic} 
    Wait Until Element Is Visible    name=Zodiac_Score
    Input Text         name=Zodiac_Score            ${ZodiacScore} 

    # อัปโหลดไฟล์รูปภาพโดยใช้ XPath
    Wait Until Element Is Visible    xpath=//input[@type='file']
    Choose File        xpath=//input[@type='file']          ${IMAGE_PATH}  # ระบุพาธไฟล์รูปภาพ

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    Wait Until Element Is Visible    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    Click Button       xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    
    # จัดการกับ Alert ที่ปรากฏ
    Handle Alert    ACCEPT
    Wait Until Page Contains     รายการราศี
    Close Browser

*** Test Cases ***
Edit First Zodiac Information Test With Missing Data
    [Documentation]    ทดสอบการ Edit ราศีที่แถวแรกในตาราง โดยใส่ข้อมูลไม่ครบ
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/zodiac']
    Click Element      xpath://*[@href='/zodiac']
    Wait Until Element Is Visible    xpath=//table//tr[1]//button[text()='Edit']
    Click Element      xpath=//table//tr[1]//button[text()='Edit']
    Wait Until Page Contains         แก้ไขข้อมูลราศี    
    
    Sleep   3s  # รอ 3 วินาที เพื่อรอหน้าข้อมูลโหลด

    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=Zodiac_WorkTopic   10s
    Input Text         name=Zodiac_WorkTopic       ${WorkTopic}  
    Wait Until Element Is Visible    name=Zodiac_FinanceTopic  10s
    Input Text         name=Zodiac_FinanceTopic       ${FinanceTopic} 
    Wait Until Element Is Visible    name=Zodiac_LoveTopic    10s
    Input Text         name=Zodiac_LoveTopic          ${LoveTopic} 

    # แก้ไขข้อมูลในฟอร์ม โดยเว้นฟิลด์ที่เป็น Required ไว้
    Wait Until Element Is Visible    name=Zodiac_Score
    Input Text         name=Zodiac_Score            ${EMPTY} 

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    Wait Until Element Is Visible    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    Click Button       xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    
    Wait Until Page Contains    แก้ไขข้อมูลราศี

    Close Browser
