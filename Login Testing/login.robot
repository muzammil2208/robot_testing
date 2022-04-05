*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${password_correct}     secret_sauce

*** Test Cases ***
login_pass
    [tags]  smoke
    log on to the sauceLabs
    enter valid credentials
    page should contain element    xpath:/html/body/div/div/div/div[1]/div[2]/span
    close browser

login_fail
    [tags]  smoke
    log on to the sauceLabs
    enter invalid credentials
    page should contain     Epic sadface: Username and password do not match any user in this service
    close browser  

logout
    log on to the sauceLabs
    enter valid credentials
    page should contain element    xpath:/html/body/div/div/div/div[1]/div[2]/span
    click element   id:react-burger-menu-btn
    sleep    1s
    click element   id:logout_sidebar_link
    page should contain element     id:login-button
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

log on to the sauceLabs
    open browser     https://www.saucedemo.com/      chrome