*** Settings ***
Library    String
Resource    ${CURDIR}/../../Resources/PageObjects/Maps.resource
Resource    ${CURDIR}/../../Resources/Variables/variables.resource
 
Test Setup      Start Maps App
Test Teardown   Close Application



*** Test Cases ***
Verify user can search for a location
    [Documentation]    ensure that users can successfully search for a location using the maps application.
    [Tags]    TC_MP_001    SRD_AND_1
    Maps.click on maps
    Maps.click on search all destinations
    Maps.input text in search all destinations edit box    Delhi
    Maps.click on search result    Delhi
    Maps.page contains element    New Delhi

Verify user can search for a location - Text comparison
    [Documentation]    validate the accuracy of location search by text comparison
    [Tags]    TC_MP_002    SRD_AND_1    SRD_AND_2
    Maps.click on maps
    Maps.click on search all destinations
    Maps.input text in search all destinations edit box    Mumbai
    Maps.click on search result    Mumbai
    Maps.page contains element    Mumbai

 