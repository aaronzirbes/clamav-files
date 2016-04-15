#!/bin/bash

quarantine=/usr/local/var/lib/clamav/quarantine
logs=/usr/local/var/log

# Update AV defs
freshclam

# start scanning
fswatch ~/ | while read line; do
    [ -f "$line" ] && clamdscan --no-summary --move=$quarantine "$line" >> ${logs}/clamwatch.log
done
