*** settings ***
Library     SeleniumLibrary


*** variables ***
${driver_url}          c:\\users\\dell\\downloads\\chromedriver\\chromedriver.exe
${password_field_xpath}       /html/body/div/div/div[2]/div[1]/div[1]/div/form/div[2]/input
${cart_item_xpath}         /html/body/div/div/div/div[2]/div/div[1]/div[3]/div[1]
${saucelabs_backpack}       /html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[2]/button
${cart_icon}        /html/body/div/div/div/div[1]/div[1]/div[3]/a
${saucelabs_bike_light}      /html/body/div/div/div/div[2]/div/div/div/div[2]/div[2]/div[2]/button
${saucelabs_bolt_tshirt}        /html/body/div/div/div/div[2]/div/div/div/div[3]/div[2]/div[2]/button
${saucelabs_fleece_jacket}      /html/body/div/div/div/div[2]/div/div/div/div[4]/div[2]/div[2]/button
${saucelabs_onesie}     /html/body/div/div/div/div[2]/div/div/div/div[5]/div[2]/div[2]/button
${sauclabs_testallthings_tshirt}        /html/body/div/div/div/div[2]/div/div/div/div[6]/div[2]/div[2]/button
@{products_to_add}   ${saucelabs_bike_light}   ${saucelabs_onesie}   ${saucelabs_fleece_jacket}
*** keywords ***

# common keywordd
check add to cart button converted
    [Arguments]     ${button_xpath}
    ${button_string}        get Text        xpath=${button_xpath}
    should be equal as strings      ${button_string}        REMOVE

login to saucelabs
    Open browser    https://www.saucedemo.com/      chrome
    input Text      id:user-name        standard_user
    input Text      xpath:${password_field_xpath}       secret_sauce
    click Button            id:login-button 
    
check item is added to cart
     ${cart_item_count}=     Get Element count        class:cart_item
    IF   ${cart_item_count} > 0
         log to console    ${cart_item_count}
    ELSE
        FAIL     Product not added to cart
    END    

check saucelabsBackpack and SauceLabsBikeLight is added to cart
    ${cart_item_count}=     Get Element count        class:cart_item
   
    IF   ${cart_item_count} == 2
         log to console    products is added
         page should contain    Sauce Labs Backpack
         page should contain    Sauce Labs Bike Light
    ELSE
        FAIL     Product not added to cart
    END     

check saucelabsbikelight,saucelabsonesie and saucelabs fleece jacket are added to cart
    ${cart_item_count}=     Get Element count        class:cart_item
   
    IF   ${cart_item_count} == 3
         log to console    products is added
         page should contain    Sauce Labs Onesie
         page should contain    Sauce Labs Bike Light
         page should contain    Sauce Labs Fleece Jacket
    ELSE
        FAIL     Product not added to cart
    END   



# main keywords for checking cart items
    
check cart for no item
    click element   xpath:${cart_icon}
    ${cart_item_count}=     Get Element count        xpath:${cart_item_xpath}
    IF   ${cart_item_count} > 0
         FAIL   item is present
    ELSE
        log to console      no item present
    END

check cart for SauceLabsBackpack

    click element   xpath:${saucelabs_backpack}
    check add to cart button converted  ${saucelabs_backpack}
    click element   xpath:${cart_icon}
    check item is added to cart

check cart for SauceLabsBikeLight
    click element   xpath:${saucelabs_bike_light}
    check add to cart button converted  ${saucelabs_bike_light}
    click element   xpath:${cart_icon}
    check item is added to cart

check cart for SauceLabsBoltTshirt
    click element   xpath:${saucelabs_bolt_tshirt}
    check add to cart button converted  ${saucelabs_bolt_tshirt}
    click element   xpath:${cart_icon}
    check item is added to cart

check cart for SauceLabsFleeceJacket
    click element   xpath:${saucelabs_fleece_jacket}
    check add to cart button converted  ${saucelabs_fleece_jacket}
    click element   xpath:${cart_icon}
    check item is added to cart

check cart for SauceLabsOnesie
    click element   xpath:${saucelabs_onesie}
    check add to cart button converted  ${saucelabs_onesie}
    click element   xpath:${cart_icon}
    check item is added to cart

check cart for SauceLabsTestAllThingsTshirt
    click element   xpath:${sauclabs_testallthings_tshirt}
    check add to cart button converted  ${sauclabs_testallthings_tshirt}
    click element   xpath:${cart_icon}
    check item is added to cart

check cart for SauceLabsBackpack+SauceLabsBikeLight
    click element   xpath:${saucelabs_backpack}
    click element   xpath:${saucelabs_bike_light}
    check add to cart button converted  ${saucelabs_backpack}
    check add to cart button converted  ${saucelabs_bike_light}
    click element   xpath:${cart_icon}
    check saucelabsBackpack and SauceLabsBikeLight is added to cart

check cart for SaucelabsBikeLight + SauceLabsOnesie + SauceLabsFleeceJacket
    
    FOR    ${item}   IN     @{products_to_add}
            click element   xpath:${item}
            check add to cart button converted  ${item}
    END
    click element   xpath:${cart_icon}
    check saucelabsbikelight,saucelabsonesie and saucelabs fleece jacket are added to cart