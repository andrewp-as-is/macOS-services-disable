#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.quicklook.32bit
set "$@" com.apple.quicklook.ThumbnailsAgent
set "$@" com.apple.quicklook
set "$@" com.apple.quicklook.ui.helper


for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
