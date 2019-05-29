#!/usr/bin/env bash


files="$(find /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "*.disabled")"
[[ -n "$files" ]] && while IFS= read src; do
    dst="${src/.disabled/}"
    sudo mv "$src" "$dst"
    sudo /bin/launchctl load -w "$dst"
done <<< "$files";:
