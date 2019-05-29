#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.ctkbind # SmartCard pairing tool

# LaunchDaemons
set "$@" com.apple.ifdreader # SmartCard reader daemon

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
