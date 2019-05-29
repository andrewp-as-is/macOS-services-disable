#!/usr/bin/env bash

# LaunchAgents
set "$@" com.apple.appleseed.seedusaged com.apple.appleseed.fbahelperd # Apple feedback
set "$@" com.apple.diagnostics_agent
set "$@" com.apple.ReportCrash.Self com.apple.ReportCrash com.apple.ReportPanic com.apple.ReportGPURestart com.apple.ReportCrash.Root
set "$@" com.apple.SocialPushAgent
set "$@" com.apple.spindump_agent
set "$@" com.apple.sysdiagnose_agent

# LaunchDaemons
# set "$@" com.apple.apsd # Apple Push Notification service daemon
set "$@" com.apple.awdd # collects diagnostics and usage data
set "$@" com.apple.CrashReporterSupportHelper
set "$@" com.apple.ProcessPanicReport
set "$@" com.apple.ReportCrash.Root.Self com.apple.ReportCrash.Root com.apple.ReportPanicService
set "$@" com.apple.spindump
set "$@" com.apple.SubmitDiagInfo
set "$@" com.apple.symptomsd-diag com.apple.symptomsd
set "$@" com.apple.sysdiagnose com.apple.sysdiagnose_helper


for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
