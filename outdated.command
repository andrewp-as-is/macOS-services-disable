#!/usr/bin/env bash

# todo: BiometricKit

# LaunchDaemons
set "$@" com.apple.dvdplayback.setregion

set "$@" com.apple.AirPlayUIAgent AirPlayXPCHelper # AirPlay

set "$@" com.apple.bird # iCloud backing documents daemon

set "$@" com.apple.CalendarAgent
set "$@" com.apple.captiveagent # Captive Portal (hacks)
# set "$@" com.apple.cloudd # iCloud sync
# set "$@" com.apple.cloudpaird
set "$@" com.apple.cloudphotosd # photo sharing agent
set "$@" com.apple.CommCenterRootHelper com.apple.CommCenter-osx # CoreTelephony
set "$@" com.apple.commerce # Mac App Store, the iTunes Store, iBooks Store, etc

set "$@" com.apple.eapolcfg_auth # A launch-on-demand daemon used to configure EAP over LAN (EAPOL)


set "$@" com.apple.iCloudStats com.apple.iCloudUserNotification
set "$@" com.apple.identityservicesd # iCloud/iMessage/FaceTime background stuff.
set "$@" com.apple.idsremoteurlconnectionagent

set "$@" com.apple.GameController.gamecontrollerd

set "$@" com.apple.followupd # social-network integration and notifications

set "$@" com.apple.gamed # Game Center

set "$@" com.apple.msrpc.echosvc com.apple.msrpc.lsarpc com.apple.msrpc.lsarpc com.apple.msrpc.mdssvc com.apple.msrpc.netlogon com.apple.msrpc.srvsvc com.apple.msrpc.wkssvc # Microsoft RPC

set "$@" com.apple.netbiosd # Microsoft's networking service

set "$@" com.apple.passd # Apple Pay and Wallet operations
set "$@" com.apple.personad # The system daemon backing profile photo storage
set "$@" com.apple.photoanalysisd # faces recognition
set "$@" com.apple.photolibraryd # The macOS photo library agent

set "$@" com.apple.revisiond # revisiond -- storage manager for document revisions

set "$@" com.apple.suggestd # detect contacts, events, named entities, etc.

set "$@" com.apple.telephonyutilities.callservicesd

#set "$@" com.apple.security.cloudkeychainproxy3 com.apple.security.idskeychainsyncingproxycom.apple.security.keychain-circle-notification
set "$@" com.apple.security.FDERecoveryAgent # Full Disk Encryption Key Recovery Transmission Agent
set "$@" com.apple.syncdefaultsd # background service to sync to iCloud
set "$@" com.apple.syncservices.SyncServer
set "$@" com.apple.syncservices.uihandler

set "$@" com.apple.telephonyutilities.callservicesd # Telephony

set "$@" com.apple.uucp # Unix-to-Unix Copy

set "$@" ntalk
set "$@" tftp # Trivial File Transfer Protocol server


for name in "$@"; do
    find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "$name.plist" -exec sh -c 'test -e $0 && { sudo /bin/launchctl unload $0 2> /dev/null; sudo mv $0 $0.disabled; }' {} \;
done;:
