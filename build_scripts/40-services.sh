#!/bin/bash

systemctl enable rpm-ostree-countme.service
systemctl --global enable podman-auto-update.timer
systemctl enable rpm-ostree-countme.service
systemctl disable rpm-ostree.service
systemctl enable dconf-update.service
# Forcefully enable brew setup since the preset doesnt seem to work?
systemctl enable brew-setup.service
systemctl disable mcelog.service
systemctl enable tailscaled.service
systemctl enable uupd.timer
systemctl enable ublue-system-setup.service
systemctl --global enable ublue-user-setup.service
systemctl mask bootc-fetch-apply-updates.timer bootc-fetch-apply-updates.service
