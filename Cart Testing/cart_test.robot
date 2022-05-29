*** Settings ***
Library     SeleniumLibrary
Resource        ../common.robot
Test Teardown   close browser

*** Test Cases ***
test product
       login to saucelabs
       check cart for no item
*** Keywords ***




