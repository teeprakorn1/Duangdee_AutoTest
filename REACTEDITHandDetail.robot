*** Settings ***
Documentation     Test Suite สำหรับการแก้ไขข้อมูลลายมือแถวแรก
Library           SeleniumLibrary

*** Variables ***
${URL}            https://duangdee-app.com/
${BROWSER}        chrome
${VALID_USERNAME}    admin
${VALID_PASSWORD}     Cs12345678
${็Handname}          โชคไม่ดีอย่างมาก
${HandDescription}   ในช่วงเวลานี้ คุณอาจต้องเผชิญกับอุปสรรคและปัญหาที่รุนแรงมาก มีการเปลี่ยนแปลงที่ไม่คาดคิดเข้ามาในชีวิตซึ่งทำให้คุณรู้สึกท้อแท้และหมดกำลังใจ ควรพยายามหาความสงบและหาวิธีจัดการกับความเครียด รวมถึงการหาความช่วยเหลือจากคนใกล้ชิดเพื่อผ่านช่วงเวลานี้ไปให้ได้.
${HandPercent}          0  
${EMPTY}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

*** Test Cases ***
Edit First Sum Information Test
    [Documentation]    ทดสอบการ Edit ลายมือที่แถวแรกในตาราง
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/hand-detail']
    Click Element      xpath://*[@href='/hand-detail']
    Wait Until Element Is Visible    xpath://table//tr[1]//button[text()='Edit']
    Click Element      xpath://table//tr[1]//button[text()='Edit']
    Wait Until Page Contains         แก้ไขข้อมูลรายละเอียดมือ


    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=HandDetail_Name    10s
    Input Text         name=HandDetail_Name   ${็Handname}
    Wait Until Element Is Visible    name=HandDetail_Detail    10s
    Input Text         name=HandDetail_Detail    ${HandDescription} 
    Wait Until Element Is Visible    name=HandDetail_MinPercent    10s
    Input Text         name=HandDetail_MinPercent    ${HandPercent} 

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']

    # จัดการกับ Alert ที่ปรากฏ
    Handle Alert    ACCEPT

    # ตรวจสอบว่าการบันทึกสำเร็จ
    Wait Until Page Contains     ข้อมูลรายละเอียดมือ

    Close Browser

*** Test Cases ***
Edit First Sum Information Test With Missing Data
    [Documentation]    ทดสอบการ Edit ลายมือที่แถวแรกในตาราง
    [tags]             regression
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Sleep              2s
    Wait Until Element Is Visible    xpath://*[@href='/hand-detail']
    Click Element      xpath://*[@href='/hand-detail']
    Wait Until Element Is Visible    xpath://table//tr[1]//button[text()='Edit']
    Click Element      xpath://table//tr[1]//button[text()='Edit']
    Wait Until Page Contains         แก้ไขข้อมูลรายละเอียดมือ


    # แก้ไขข้อมูลในฟอร์ม
    Wait Until Element Is Visible    name=HandDetail_Name    10s
    Input Text         name=HandDetail_Name   ${็Handname}   
    Wait Until Element Is Visible    name=HandDetail_Detail    10s
    Input Text         name=HandDetail_Detail    ${HandDescription} 

    # แก้ไขข้อมูลในฟอร์ม โดยเว้นฟิลด์ที่เป็น Required ไว้
    Wait Until Element Is Visible    name=HandDetail_MinPercent    10s
    Input Text         name=HandDetail_MinPercent      ${EMPTY}  

    # เลื่อนหน้าเว็บไปยังปุ่มบันทึก
    Scroll Element Into View    xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']
    # บันทึกข้อมูล
    Click Button       xpath=//button[@type='submit' and text()='บันทึกการเปลี่ยนแปลง']

    # ตรวจสอบว่าการบันทึกสำเร็จ
    Wait Until Page Contains     แก้ไขข้อมูลรายละเอียดมือ

    Close Browser



