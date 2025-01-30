#!/bin/bash

set -xeuo pipefail

systemctl enable gdm.service
systemctl enable fwupd.service
# enable systemd-resolved for proper name resolution
# FIXME: this does not yet work, the resolution service fails for somer reason
systemctl enable systemd-resolved.service
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
