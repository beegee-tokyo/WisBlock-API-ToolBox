#!/bin/bash

OS_VERS=`sw_vers -productVersion`
if [ $? -ne 0 ]; then
  echo "this script must be run on macOS!"
  exit 1
fi
APP_PATH="WisBlock-API-ToolBox.app"
if [ -e "${APP_PATH}.tar" ]; then
  tar -xf "${APP_PATH}.tar"
  rm "${APP_PATH}.tar"
fi
if [ -e "${APP_PATH}" ]; then
  /usr/bin/xattr -cr "${APP_PATH}"
  /usr/bin/codesign --force --deep  --timestamp --entitlements Entitlements.plist -s - "${APP_PATH}"
fi
