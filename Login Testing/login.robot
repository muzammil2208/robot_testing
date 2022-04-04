*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${password_correct}     secret_sauce

*** Test Cases ***
login_pass
    open browser    https://www.saucedemo.com/      chrome
    enter valid credentials
    page should contain element    xpath:/html/body/div/div/div/div[1]/div[2]/span
    sleep   3s
    close browser

login_fail
    open browser    https://www.saucedemo.com/      chrome
    enter invalid credentials
    page should contain     Epic sadface: Username and password do not match any user in this service
    sleep   2s
    close browser  

*** Keywords ***
enter valid credentials
     input text      id:user-name    standard_user
     input password  id:password     ${password_correct}
     click element   id:login-button

enter invalid credentials
    input text      id:user-name    muzammil
    input password  id:password     hello
    click element   id:login-button