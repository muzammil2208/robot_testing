*** Settings ***
Library     SeleniumLibrary
Test Setup  log on to sauceLabs
Test Teardown      close browser

*** Variables ***

${username_field}       xpath:/html/body/div/div/div[2]/div[1]/div[1]/div/form/div[1]/input
${password_field}       xpath:/html/body/div/div/div[2]/div[1]/div[1]/div/form/div[2]/input
${login_btn}            id:login-button
${error_message_container}      xpath:/html/body/div/div/div[2]/div[1]/div[1]/div/form/div[3]/h3
${saucelabs_header}         xpath:/html/body/div/div/div/div[1]/div[1]/div[2]/div
${problem_user_img}      	https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg

*** Test Cases ***
Valid_user
    Enter Credentials   standard_user       secret_sauce
    page should contain element   ${saucelabs_header}

Locked_out_user
    Enter Credentials       locked_out_user        secret_sauce
    Element Text should be      ${error_message_container}          Epic sadface: Sorry, this user has been locked out.
         
problem_user
    Enter Credentials  problem_user     secret_sauce
    page should contain element  ${saucelabs_header}
    ${products_img}=  Get Element Attribute   xpath:/html/body/div/div/div/div[2]/div/div/div/div[1]/div[1]/a/img     src   
    should be equal as strings  ${products_img}   ${problem_user_img}

performance_glitch_user
    Enter credentials   performance_glitch_user     secret_sauce
    Sleep   3s
    page should contain element   ${saucelabs_header}


invalid_user
    Enter Credentials  muzammil  khan
    Element text should be       ${error_message_container}      Epic sadface: Username and password do not match any user in this service

*** Keywords ***

Enter Credentials
    [Arguments]         ${username}         ${password}
    input text      ${username_field}       ${username}
    input text      ${password_field}   ${password}
    click element   ${login_btn}


log on to sauceLabs
    open browser     https://www.saucedemo.com/     chrome