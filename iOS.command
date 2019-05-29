#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.CallHistoryPluginHelper com.apple.CallHistorySyncHelper
set "$@" com.apple.cdpd # Cellular Digital Packet Data

# set "$@" com.apple.ManagedClientAgent.agent com.apple.ManagedClientAgent.enrollagent # mobile accounts
set "$@" com.apple.mdmclient.agent # MDM - Mobile Device Management
set "$@" com.apple.RapportUIAgent com.apple.rapportd-user # Phone Call Handoff

# LaunchDaemons
set "$@" com.apple.coreduetd.osx
# set "$@" com.apple.ManagedClient.cloudconfigurationd com.apple.ManagedClient.enroll com.apple.ManagedClient com.apple.ManagedClient.startup
set "$@" com.apple.mdmclient.daemon com.apple.mdmclient.daemon.runatboot # MDM - Mobile Device Management
set "$@" com.apple.rapportd # Phone Call Handoff

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
