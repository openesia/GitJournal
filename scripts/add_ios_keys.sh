#!/usr/bin/env bash

set -eox pipefail

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cd ios/keys/
cp ./CI.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/

security create-keychain -p "" build.keychain
security import ios_distribution.cer -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

#security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
