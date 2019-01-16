#!/bin/bash

npm install -g appcenter-cli

appcenter login --token $APPCENTER_TOKEN

./../gradlew assembleDebugAndroidTest

echo $APPCENTER_OUTPUT_DIRECTORY/*.apk
appcenter test run espresso --app "capuchintech/MobileAzureDevDays" --devices e10c8ae6 --app-path $APPCENTER_SOURCE_DIRECTORY/Java/MobileAzureDevDays/app/build/outputs/apk/debug\app-debug.apk  --test-series "launch-tests" --locale "en_US" --build-dir $APPCENTER_SOURCE_DIRECTORY/Java/MobileAzureDevDays/app/build/outputs/apk/androidTest/debug