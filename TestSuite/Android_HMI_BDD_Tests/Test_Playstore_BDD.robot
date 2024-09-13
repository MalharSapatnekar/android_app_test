*** Settings ***
Resource    ${CURDIR}/../../Resources/BusinessObjects/PlayStoreKeywords.resource
Suite Teardown   Close Application


*** Test Cases ***

Verify user can download an app
    [Documentation]    verify that users can successfully download an app from the Play Store.
    [Tags]    TC_PS_001    SRD_AND_3
    Given the user opens the Play Store app
    When the user search for and install "YouTube Music" from the search results
    Then the app should get downloaded

