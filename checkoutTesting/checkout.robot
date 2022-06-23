*** Settings ***
Library     SeleniumLibrary
Resource        ../common.robot
Test Teardown   close browser
Test Setup      login to saucelabs


*** Test Cases ***
NoProducts
    try to check out without adding products to cart

SauceLabsBackpack
    checkout with saucelabsbackpack

SauceLabsBikeLight
    checkout with saucelabsbikelight

SauceLabsBoltTshirt
    checkout with SauceLabsBoltTshirt

multipleitems
    checkout with saucelabsbackpack and saucelabsbikelight