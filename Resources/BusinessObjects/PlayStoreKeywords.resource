*** Settings ***
Library          ApplicationLibrary.MobileLibrary
Resource    ${CURDIR}/../../Resources/Variables/variables.resource
Resource    ${CURDIR}/../../Resources/PageObjects/PlayStore.resource

*** Keywords ***


the user opens the Play Store app
    PlayStore.Start PlayStore App
    PlayStore.Reset App

the user search for and install ${appname} from the search results
    PlayStore.click on search button
    PlayStore.input text in search bar    ${appname}
    PlayStore.press enter Keycode
    PlayStore.click on app search result    ${appname}
    PlayStore.click on install button

the app should get downloaded
    PlayStore.page contains uninstall button    
    
    