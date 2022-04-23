*** Settings ***
Library     SeleniumLibrary
Suite Teardown      shutdown
Test Setup      login to sauceLabs
Test Teardown   test shutdown

*** Variables ***
${standardUser}     standard_user
${correct_password}     secret_sauce

*** Test Cases ***
Add backpack
    [tags]      functional
    click element   id:add-to-cart-sauce-labs-backpack
    ${count}=  Get Element Count    xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a/span
    Run Keyword IF  ${count} > 0  check backpack in cart   
    ...  ELSE  FAIL     Item not added to cart 
      
add bike light
    [tags]       functional
    click element   id:add-to-cart-sauce-labs-bike-light
    ${count}=  Get Element Count    xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a/span
    Run Keyword IF  ${count} > 0  check bike-light in cart
    ...  ELSE  FAIL      Item not added to carts

add bold t-shirt
    [tags]      functional 
    click element   id:add-to-cart-sauce-labs-bolt-t-shirt
    ${count}=  Get Element Count    xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a/span
    Run Keyword IF  ${count} > 0  check bolt-tshirt in cart
    ...  ELSE  FAIL      Item not added to carts
    


add fleece-jacket
    [tags]      functional 
    click element   id:add-to-cart-sauce-labs-fleece-jacket
    ${count}=  Get Element Count    xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a/span
    Run Keyword IF  ${count} > 0  check fleece-jacket in cart
    ...  ELSE  FAIL      Item not added to carts

add Onesie
    [tags]      functional 
    click element   id:add-to-cart-sauce-labs-onesie
    ${count}=  Get Element Count    xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a/span
    Run Keyword IF  ${count} > 0  check Onesie in cart
    ...  ELSE  FAIL      Item not added to carts

add Test all t-shirt
    [tags]      functional 
    click element   id:add-to-cart-test.allthethings()-t-shirt-(red)
    ${count}=  Get Element Count    xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a/span
    Run Keyword IF  ${count} > 0  check Test-all-things-Tshirt in cart 
    ...  ELSE  FAIL      Item not added to carts


*** Keywords ***
test shutdown
    close browser
shutdown
    close all browsers

login to sauceLabs
    open browser     https://www.saucedemo.com/      chrome
    input text      id:user-name    ${standardUser}
    input password  id:password     ${correct_password}
    click element   id:login-button
    page should contain    Sauce Labs Backpack

check backpack in cart
    click element   xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a
    page should contain     Sauce Labs Backpack


check bike-light in cart
    click element      xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a
    page should contain        Sauce Labs Bike Light

check bolt-tshirt in cart
    click element   xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a
    page should contain     Sauce Labs Bolt T-Shirt

check fleece-jacket in cart
    click element   xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a
    page should contain     Sauce Labs Fleece Jacket

check Onesie in cart
    click element   xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a
    page should contain     Sauce Labs Onesie

check Test-all-things-Tshirt in cart
    click element   xpath:/html/body/div[1]/div/div/div[1]/div[1]/div[3]/a
    page should contain    Test.allTheThings() T-Shirt (Red)
