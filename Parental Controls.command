#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.familycircled com.apple.familycontrols.useragent com.apple.familynotificationd
set "$@" com.apple.parentalcontrols.check

# LaunchDaemons
set "$@" com.apple.familycontrols


for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
