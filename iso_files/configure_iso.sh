#!/usr/bin/env bash

MAJOR_VERSION_NUMBER=10
dnf config-manager --add-repo "https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/epel-${MAJOR_VERSION_NUMBER}/ublue-os-staging-epel-$MAJOR_VERSION_NUMBER.repo"
dnf config-manager --set-enabled "copr:copr.fedorainfracloud.org:ublue-os:staging"
dnf install -y \
  anaconda \
  anaconda-install-env-deps \
  anaconda-live \
  anaconda-webui

systemctl disable brew-setup.service
systemctl disable uupd.timer
systemctl --global disable podman-auto-update.timer
systemctl disable rpm-ostree.service
systemctl disable uupd.timer
systemctl disable ublue-system-setup.service
systemctl --global disable ublue-user-setup.service
systemctl disable check-sb-key.service
