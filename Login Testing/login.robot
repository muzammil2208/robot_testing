*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
login_pass
    open browser    https://www.saucedemo.com/      chrome
    input text      id:user-name    standard_user
    input password  id:password     secret_sauce
    click element   id:login-button
    page should contain element    xpath:/html/body/div/div/div/div[1]/div[2]/span
    sleep   3s
    close browser

login_fail
    open browser    https://www.saucedemo.com/      chrome
    input text      id:user-name    muzammil
    input password  id:password     khan
    click element   id:login-button
    page should contain     Epic sadface: Username and password do not match any user in this service
    sleep   2s
    close browser  
