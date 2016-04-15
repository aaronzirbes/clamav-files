#!/bin/bash

brew install clamav

mkdir -p /usr/local/var/run/clamav
mkdir -p /usr/local/var/lib/clamav

ln -s clamd.conf /usr/local/etc/clamav/clamd.conf
ln -s freshclam.conf /usr/local/etc/clamav/freshclam.conf

