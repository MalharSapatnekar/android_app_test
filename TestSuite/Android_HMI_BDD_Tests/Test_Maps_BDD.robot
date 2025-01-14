*** Settings ***

Resource    ${CURDIR}/../../Resources/BusinessObjects/MapsKeywords.resource   
Test Setup    Maps.Start Maps App
Test Teardown   Close Application


*** Test Cases ***

Verify user can search for a location
    [Documentation]    ensure that users can successfully search for a location using the maps application.
    [Tags]    TC_MP_001    SRD_AND_1
    Given the user open the maps application
    When the user search for Delhi
    Then user should see Delhi in the search results

Verify user can search for a location - multi line
    [Documentation]    validate the accuracy of location search by text comparison
    [Tags]    TC_MP_002    SRD_AND_1    SRD_AND_2
    Given the user open the maps application
    When the user search for Mumbai, Maharashtra
    Then user should see Mumbai, Maharashtra in the search results

