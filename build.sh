#!/bin/zsh
# Builds Clipboard.app and installs it to /Applications.
set -euo pipefail
cd "$(dirname "$0")"

APP=build/Clipboard.app
rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS"
cp Info.plist "$APP/Contents/Info.plist"
swiftc -O -swift-version 5 Sources/main.swift -o "$APP/Contents/MacOS/Clipboard"
codesign --force --sign - --identifier com.adamrizananda.clipboard "$APP"

if [[ "${1:-}" == "--install" ]]; then
  pkill -x Clipboard || true
  rm -rf /Applications/Clipboard.app
  cp -R "$APP" /Applications/
  open /Applications/Clipboard.app
  echo "Installed to /Applications/Clipboard.app"
fi
