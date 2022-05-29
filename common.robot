*** settings ***
Library     SeleniumLibrary


*** variables ***
${driver_url}          c:\\users\\dell\\downloads\\chromedriver\\chromedriver.exe
${password_field_xpath}       /html/body/div/div/div[2]/div[1]/div[1]/div/form/div[2]/input
${cart_item_xpath}         /html/body/div/div/div/div[2]/div/div[1]/div[3]/div[1]
${saucelabs_backpack}       /html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[2]/button
*** keywords ***
login to saucelabs
    Open browser    https://www.saucedemo.com/      chrome
    input Text      id:user-name        standard_user
    input Text      xpath:${password_field_xpath}       secret_sauce
    click Button            id:login-button 
    click Element      xpath:${saucelabs_backpack}

    
check cart for no item
    click element   xpath:/html/body/div/div/div/div[1]/div[1]/div[3]/a
    ${cart_item_count}=     Get Element count        xpath:${cart_item_xpath}
    IF   ${cart_item_count} > 0
         FAIL   item is present
    ELSE
        log to console      no item present
    END
