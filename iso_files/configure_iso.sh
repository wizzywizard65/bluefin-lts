#!/usr/bin/env bash

YAI_LATEST=$(curl -fSsL https://api.github.com/repos/ublue-os/yai/releases/latest | jq -r --arg arch $(arch) '.assets[] | select(.name | match("yai-.*."+$arch+".rpm")) | .browser_download_url')
dnf install -y $YAI_LATEST
mkdir -p /etc/gnome-initial-setup
tee /etc/gnome-initial-setup/vendor.conf <<EOF
[live_user pages]
skip=privacy;timezone;software;goa

[install]
application=yai.desktop
EOF

systemctl disable brew-setup.service
systemctl disable uupd.timer
systemctl --global disable podman-auto-update.timer
systemctl disable rpm-ostree.service
systemctl disable uupd.timer
systemctl disable ublue-system-setup.service
systemctl --global disable ublue-user-setup.service
systemctl disable check-sb-key.service
