#!/bin/bash

set -xeuo pipefail

dnf -y --enablerepo copr:copr.fedorainfracloud.org:ublue-os:staging install ublue-brew
