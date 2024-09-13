*** Settings ***
Library    ApplicationLibrary.MobileLibrary
Resource    ${CURDIR}/../../Resources/Variables/variables.resource
*** Variables ***
${app_download_timeout}    60
${enterkey_code}     66

  
${uninstall_button_text}    Uninstall
${install_button_text}    install

*** Keywords ***
Start PlayStore App
    Open Application        ${REMOTE_URL}     platformName=${PLATFORM_NAME}    automationName=${AUTOMATION_NAME}    deviceName=${DEVICE_NAME}
        ...                     newCommandTimeout=${commandTimeout}       appPackage=${PLAYSTORE_APP_PACKAGE}    appActivity=${PLAYSTORE_APP_ACTIVITY}
Reset App
    Reset Application
click on search button
    Wait For And Click Element    //android.widget.ImageView[@bounds='[539,78][578,117]']    timeout=10

input text in search bar
    [Arguments]    ${app_name}
    Wait For And Input Text    //android.widget.EditText[@resource-id='com.android.vending:id/car_ui_toolbar_search_bar']    ${app_name}    timeout=10
press enter Keycode
    Press Keycode     66

click on app search result
    [Arguments]    ${app_name}
    Wait For And Click Element    //android.view.View[@resource-id='com.android.vending:id/0_resource_name_obfuscated' and @content-desc='${app_name}']    timeout=10



click on install button
    Wait For And Click Element     //android.widget.Button[@bounds='[140,302][642,386]' and @text='Install']    timeout=10

click on uninstall button
    Wait For And Click Element    //android.widget.Button[@bounds='[391,302][642,386]' and @text='Uninstall']    timeout=10

click on uninstall button on confirmation
    Wait Until Page Contains    //android.widget.FrameLayout[@bounds='[49,405][719,591]']    timeout=10
    Wait Until Page Contains    //android.widget.ScrollView[@bounds='[63,494][705,577]']    timeout=10
    Wait For And Click Element    //android.widget.Button[@bounds='[385,494][705,577]' and @text='Uninstall']    timeout=10

page contains install button
    Wait Until Element Contains    //android.widget.Button[@bounds='[140,302][642,386]']    ${install_button_text}    timeout=10

page contains uninstall button
    Wait Until Element Contains    //android.widget.Button[@bounds='[391,302][642,386]']    ${uninstall_button_text}    ${app_download_timeout}    
  
