#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.assistant_service com.apple.assistantd # iOS Siri
set "$@" com.apple.coreparsec.silhouette # part of Siri's backend
set "$@" com.apple.knowledge-agent # Siri's proactive knowledge functionality
set "$@" com.apple.parsecd # Location-Based Suggestions for Siri
set "$@" com.apple.Siri.agent

for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
