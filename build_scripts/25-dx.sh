#!/bin/bash

set -xeuo pipefail

# This is for better testing, we might split this later

# VSCode on the base image!
dnf config-manager --add-repo "https://packages.microsoft.com/yumrepos/vscode"
dnf config-manager --set-disabled packages.microsoft.com_yumrepos_vscode
# TODO: Add the key from https://packages.microsoft.com/keys/microsoft.asc somehow
# rpm --import https://packages.microsoft.com/keys/microsoft.asc fails for some reason.
dnf -y --enablerepo packages.microsoft.com_yumrepos_vscode --nogpgcheck install code
