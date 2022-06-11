*** Settings ***
Library     SeleniumLibrary
Resource        ../common.robot
Test Setup    login to saucelabs
Test Teardown   close browser

*** Test Cases ***
no product
       check cart for no item

SauceLabsBackpack 
       check cart for SauceLabsBackpack

SauceLabsBikeLight
       check cart for SauceLabsBikeLight

SauceLabsBoltTshirt
       check cart for SauceLabsBoltTshirt

SauceLabsFleeceJacket
       check cart for SauceLabsFleeceJacket

SauceLabsOnesie
       check cart for SauceLabsOnesie

SauceLabsTestAllThingsTshirt
       check cart for SauceLabsTestAllThingsTshirt

SauceLabsBackpackandSauceLabsBikeLight
       check cart for SauceLabsBackpack+SauceLabsBikeLight

ThreeItems
       check cart for SaucelabsBikeLight + SauceLabsOnesie + SauceLabsFleeceJacket


