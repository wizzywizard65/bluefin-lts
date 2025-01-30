#!/usr/bin/env bash

# This file needs to exist otherwise running this in a RUN label makes it so bash strict mode doesnt work.
# Thus leading to silent failures

set -euo pipefail

# Do not rely on any of these scripts existing in a specific path
# Make the names as descriptive as possible and everything that uses dnf for package installation/removal should have `packages-` as a prefix.

export MAJOR_VERSION_NUMBER="$(sh -c '. /usr/lib/os-release ; echo $VERSION_ID')"
# This also works
# export MAJOR_VERSION_NUMBER="$(tr -d -c 0-9 <<< ${MAJOR_VERSION})"

# Specifically the dash here to indicate that we do not want to run this script again
for script in /var/tmp/build_scripts/*-*.sh; do
	printf "::group:: ===%s===\n" "$(basename "$script")"
	$script
	printf "::endgroup::\n"
done

set -x

# Ensure these get run at the _end_ of the build no matter what
ostree container commit # FIXME: Maybe will not be necessary in the future. Reassess in a few years.
bootc container lint
