*** Settings ***
Library    String
Library          ApplicationLibrary.MobileLibrary
Resource    ${CURDIR}/../../Resources/Variables/variables.resource
Resource    ${CURDIR}/../../Resources/PageObjects/Maps.resource


*** Keywords ***

the user open the maps application
    Maps.Reset App

the user search for ${dest_name}    
    Maps.click on maps
    Maps.click on search all destinations
    Maps.input text in search all destinations edit box    ${dest_name}
    Maps.click on search result    ${dest_name}

user should see ${dest_name} in the search results
    Maps.page contains element    ${dest_name}

 

the search image should match with Mumbai
    Sleep    3
    ${IMAGE_NAME}    String.Replace String    ${TEST_NAME}    ${SPACE}    _
    ApplicationLibrary.MobileLibrary.Capture Page Screenshot    ${EVIDENCE_FOLDER}/${IMAGE_NAME}.png
    ImageCompare.Compare Images    ${EVIDENCE_FOLDER}/${IMAGE_NAME}.png    ${MUMBAI_IMAGE}    placeholder_file=${IMAGE_MASK}
    