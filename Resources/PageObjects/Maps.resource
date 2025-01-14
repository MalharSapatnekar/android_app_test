*** Settings ***
Resource    ${CURDIR}/../../Resources/Variables/variables.resource
Library          ApplicationLibrary.MobileLibrary

*** Variables ***


${PUNE_IMAGE}    ${CURDIR}/../../TestData/Pune.png
${MUMBAI_IMAGE}    ${CURDIR}/../../TestData/Mumbai.png
${IMAGE_MASK}    ${CURDIR}/../../TestData/mask.json

*** Keywords ***

Start Maps App
    Open Application        ${REMOTE_URL}     platformName=${PLATFORM_NAME}    automationName=${AUTOMATION_NAME}    deviceName=${DEVICE_NAME}
        ...                     newCommandTimeout=${commandTimeout}       appPackage=${MAPS_APP_PACKAGE}    appActivity=${MAPS_APP_ACTIVITY}
Reset App
    # Reset Application API not supported anymore
    Sleep    1

click on maps
    Wait For And Click Element    	//android.widget.TextView[@text="Search"]    timeout=10
    
click on search all destinations
    Wait For And Click Element    //android.widget.LinearLayout[@content-desc="Tap to search"]/android.widget.ImageView    timeout=10

input text in search all destinations edit box
    [Arguments]    ${text_input}
    Wait For And Input Text    //android.widget.EditText[@resource-id="com.google.android.apps.maps:id/destination_input_keyboard_search_edit_text"]    ${text_input}    timeout=10

click on search result
    [Arguments]    ${search_destination}
    Wait For And Click Element       //android.widget.TextView[@text='${search_destination}' and @index='0']    timeout=10 

page contains element 
    [Arguments]    ${expected_element}
    Wait Until Element Contains    //android.widget.TextView[@resource-id="com.google.android.apps.maps:id/place_details_title"]    ${expected_element}    timeout=20


