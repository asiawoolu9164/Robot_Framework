*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://automationexercise.com
${BROWSER}        Chrome
${SEARCH_TERM}    T-Shirt

*** Test Cases ***
Test Case 20: Search Products and Verify Cart After Login
    [Setup]    Open Browser And Navigate To Homepage
    Click Products Button
    Verify All Products Page
    Search For Products
    Add Products To Cart
    Click Cart Button
    Verify Products In Cart
    [Teardown]    Close Browser

*** Keywords ***
Open Browser And Navigate To Homepage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

 Click Products Button
    Click Element    xpath://a[contains(text(),'Products')]

Verify All Products Page
    Wait Until Page Contains Element    xpath://h2[contains(text(),'All Products')]

Search For Products
    Input Text    xpath://input[@placeholder='Search Product']    ${SEARCH_TERM}
    Click Element    xpath://button[@id='submit_search']


Add Products To Cart
    Page Should Contain    xpath://div[@class='overlay-content']//a[@data-product-id='28']
    Click Element    xpath://div[@class='overlay-content']//a[@data-product-id='28']

Click Cart Button
    Click Element    xpath://a[contains(text(),'Cart')]

Verify Products In Cart
    Wait Until Page Contains Element    xpath://h2[contains(text(),'Your Cart')]
    Page Should Contain Element    xpath://div[@class='cart-item']//a[contains(text(),'${SEARCH_TERM}')]