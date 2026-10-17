#!/bin/zsh
# Builds Clipboard.app and packages it as build/Clipboard-<version>.dmg (drag-to-Applications installer).
set -euo pipefail
cd "$(dirname "$0")"

./build.sh
VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" Info.plist)
DMG="build/Clipboard-$VERSION.dmg"
STAGING=build/dmg

rm -rf "$STAGING" "$DMG"
mkdir -p "$STAGING"
cp -R build/Clipboard.app "$STAGING/"
ln -s /Applications "$STAGING/Applications"

hdiutil create -volname "Clipboard" -srcfolder "$STAGING" -fs HFS+ -format UDZO -ov "$DMG" >/dev/null
rm -rf "$STAGING"
echo "Created $DMG"
