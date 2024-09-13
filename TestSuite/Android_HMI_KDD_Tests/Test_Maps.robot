*** Settings ***
Library    String
Resource    ${CURDIR}/../Resources/PageObjects/Maps.resource
Resource    ${CURDIR}/../Resources/Variables/variables.resource
# Resource    ${CURDIR}/../Resources/BusinessObjects/MapsKeywords.resource

Suite Setup      Start Maps App
Test Setup       Reset App
Suite Teardown   Close Application



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

Verify user can search for a location - Image comparison	
    [Documentation]    verify the location search by comparing images.
    [Tags]    TC_MP_003    SRD_AND_1    SRD_AND_2
    Maps.click on maps
    Maps.click on search all destinations
    Maps.input text in search all destinations edit box    Mumbai
    Maps.click on search result    Mumbai
    Maps.page contains element    Mumbai
    ${IMAGE_NAME}    Replace String    ${TEST_NAME}    ${SPACE}    _
    ApplicationLibrary.MobileLibrary.Capture Page Screenshot    ${EVIDENCE_FOLDER}/${IMAGE_NAME}.png
    ImageCompare.Compare Images    ${EVIDENCE_FOLDER}/${IMAGE_NAME}.png    ${MUMBAI_IMAGE}    placeholder_file=${IMAGE_MASK}

