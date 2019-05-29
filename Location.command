#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.CoreLocationAgent
set "$@" com.apple.Maps.mapspushd com.apple.Maps.pushdaemon # GEOlocation
set "$@" com.apple.navd # Time to Leave Daemon

# LaunchDaemons
set "$@" com.apple.icloud.fmfd.plist # Find My Friends
set "$@" com.apple.locationd

set "$@" com.apple.routined # A daemon that learns the historical location patterns of a user

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
