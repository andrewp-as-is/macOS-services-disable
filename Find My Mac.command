#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.findmymacmessenger
set "$@" com.apple.AOSHeartbeat
set "$@" com.apple.AOSPushRelay

# LaunchDaemons
set "$@" com.apple.icloud.findmydeviced
set "$@" com.apple.findmymac com.apple.findmymacmessenger

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
