*** Settings ***
Library     SeleniumLibrary
Test Template      login
Suite Teardown      suite shutdown

*** Variables ***


*** Test Cases ***      username                    password     
Invalid Username        Muzammil                    secret_sauce
Invalid Paswword        standard_user               khan
Empty Username          ${Empty}                    secret_sauce
Empty password          standard_user               ${Empty}  
Correct Credentials     standard_user               secret_sauce
    
    


    

*** Keywords ***
login
    [Arguments]      ${username}    ${password}
    log on to the sauceLabs
     input text      id:user-name    ${username}
     input password  id:password     ${password}
     click element   id:login-button
     page should contain    Sauce Labs Backpack
     close Browser



log on to the sauceLabs
    open browser     https://www.saucedemo.com/      chrome

suite shutdown
    close all browsers