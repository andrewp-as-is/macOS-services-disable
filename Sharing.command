#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.sharingd # enables AirDrop, Shared Computers, and Remote Disc in the Finder

# LaunchDaemons
# set "$@" com.apple.afpfs_checkafp com.apple.afpfs_afpLoad # AppleShare
set "$@" com.apple.awacsd # # Back to My Mac (deprecated since macOS Mojave)
set "$@" com.apple.rtcreportingd # home sharing
set "$@" com.apple.smbd com.apple.smb.preferences # SMB - filesharing and printing services to Windows clients

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
