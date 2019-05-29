#!/usr/bin/env bash

# Apple Remote Desktop (ARD)
# sudo rm -fr /System/Library/CoreServices/RemoteManagement

# LaunchAgents
set "$@" com.apple.rcd
set "$@" com.apple.RemoteDesktop.PrivilegeProxy

# LaunchDaemons
set "$@" com.apple.remotemanagementd
set "$@" com.apple.remotepairtool

set "$@" com.apple.RFBEventHelper
set "$@" com.apple.RemoteDesktop.PrivilegeProxy

set "$@" com.apple.rpmuxd # remote debugging of mobile devices

set "$@" com.apple.screensharing com.apple.screensharing.agent com.apple.screensharing.MessagesAgent com.apple.screensharing.menuextra

set "$@" com.apple.ssinvitationagent # ScreenSharing InvitationAgent

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
