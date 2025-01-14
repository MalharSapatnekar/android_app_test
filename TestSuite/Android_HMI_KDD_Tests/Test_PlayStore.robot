*** Settings ***
Resource    ${CURDIR}/../../Resources/PageObjects/PlayStore.resource
 
Suite Setup      Start PlayStore App
Suite Teardown   Close Application


*** Test Cases ***

Verify user can download an app
    [Documentation]    verify that users can successfully download an app from the Play Store.
    [Tags]    TC_PS_001    SRD_AND_3
    PlayStore.click on search button
    PlayStore.input text in search bar    Youtube Music
    PlayStore.press enter Keycode
    PlayStore.click on app search result    YouTube Music
    PlayStore.click on install button
    PlayStore.page contains uninstall button    
    
