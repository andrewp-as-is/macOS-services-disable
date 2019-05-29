#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.avconferenced com.apple.imagent com.apple.imavagent com.apple.IMLoggingAgent

# LaunchDaemons
set "$@" com.apple.cmio.AVCAssistant com.apple.cmio.AppleCameraAssistant com.apple.cmio.IIDCVideoAssistant com.apple.cmio.VDCAssistant com.apple.cmio.iOSScreenCaptureAssistant

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
