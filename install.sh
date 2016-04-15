#!/bin/bash

brew install clamav fswatch
brew install fswatch

quarantine=/usr/local/var/lib/clamav/quarantine
logs=/usr/local/var/log

if [ ! -d /usr/local/var/run/clamav ]; then
    mkdir -p /usr/local/var/run/clamav
fi
if [ ! -d /usr/local/var/lib/clamav ]; then
    mkdir -p /usr/local/var/lib/clamav
fi
if [ ! -d $quarantine ]; then
    mkdir -p $quarantine
fi

ln -s clamd.conf /usr/local/etc/clamav/clamd.conf
ln -s freshclam.conf /usr/local/etc/clamav/freshclam.conf

# Update AV defs
freshclam

## This should probably run every once in a while
clamscan -r ~/
