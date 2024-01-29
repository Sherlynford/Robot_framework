*** Settings ***
Documentation   Example test Robotframework SE Class
Library       SeleniumLibrary
Suite Setup    Open Browser  https://automationexercise.com/     chrome
 
*** Variables ***
${ชื่อ}     chatchai
${อีเมล}   65022410@up.ac.th
${เรื่อง}  test
${ข้อความ}  rolem ipsum

 
*** Keywords ***
 
 Input ชื่อ
    [Arguments]  ${ชื่อ}
    Input Text  //*[@id="contact-us-form"]/div[1]/input  ${ชื่อ}
Input อีเมล
    [Arguments]  ${อีเมล}
    Input Text   //*[@id="contact-us-form"]/div[2]/input  ${อีเมล}
Input เรื่อง
    [Arguments]  ${เรื่อง}
    Input Text  //*[@id="contact-us-form"]/div[3]/input  ${เรื่อง}
Input ข้อความ
    [Arguments]  ${ข้อความ}
    Input Text  //*[@id="message"]  ${ข้อความ}
Click Submit Button
   Click Button  //*[@id="contact-us-form"]/div[6]/input
Click Contact nav
    Click Element  //*[@id="header"]/div/div/div/div[2]/div/ul/li[8]/a
Click OK Button
    Press Keys    locator_here    ENTER
Click Home Button
    Click Button  //*[@id="form-section"]/a/span
 
*** Test Cases ***
 
Register and show OTP
    [Documentation]  This testcase is expected to see OTP page
    Page Should Contain Element  //*[@id="header"]/div/div/div/div[1]
    Click Contact nav  
    Page Should Contain Element  //*[@id="contact-page"]/div[2]/div[1]/div/h2
    Input อีเมล  ${อีเมล}
    Input ชื่อ  ${ชื่อ}
    Input เรื่อง  ${เรื่อง}
    Input ข้อความ  ${ข้อความ}
    Choose File   //*[@id="contact-us-form"]/div[5]/input   file_path= C:\\Users\\User\\Pictures\\Screenshots\\images.jpg
    Click Submit Button
    ${alert_message}=    Handle Alert    accept=true
    Log    ${alert_message}
    Click OK Button
    Page Should Contain Element  //*[@id="contact-page"]/div[2]/div[1]/div/div[2]
    Click Home Button