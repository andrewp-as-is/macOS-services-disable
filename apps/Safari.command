#!/usr/bin/env bash

# use Google Chrome :)

# LaunchAgents
set "$@" com.apple.Safari.SafeBrowsing.Service com.apple.SafariBookmarksSyncAgent com.apple.SafariCloudHistoryPushAgent com.apple.SafariHistoryServiceAgent

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
