*** Settings ***
Library     SeleniumLibrary
Resource        ../common.robot
Test Teardown   close browser
Test Setup      login to saucelabs

*** Test Cases ***
NoProducts
    try to check out without adding products to cart