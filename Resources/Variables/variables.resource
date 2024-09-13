*** Variables ***
${EVIDENCE_FOLDER}       ${OUTPUT_DIR}/
${REMOTE_URL}           http://localhost:4723/wd/hub
${commandTimeout}=      6000

${PLATFORM_NAME}    Android
${AUTOMATION_NAME}    UiAutomator2
${DEVICE_NAME}    emulator-5554


${MAPS_APP_PACKAGE}    com.google.android.apps.maps
${MAPS_APP_ACTIVITY}    com.google.android.maps.MapsActivity

${PLAYSTORE_APP_PACKAGE}    com.android.vending
${PLAYSTORE_APP_ACTIVITY}    com.google.android.finsky.carmainactivity.MainActivity    