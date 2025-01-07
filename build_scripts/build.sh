#!/usr/bin/env bash

# This file needs to exist otherwise running this in a RUN label makes it so bash strict mode doesnt work.
# Thus leading to silent failures

set -euo pipefail

# Specifically the dash here to indicate that we do not want to run this script again
for script in /var/tmp/build_scripts/*-*.sh; do
	printf "::group:: ===%s===\n" "$(basename "$script")"
	$script
	printf "::endgroup::\n"
done

set -x

# Ensure these get run at the _end_ of the build no matter what
ostree container commit # Maybe will not be necessary in the future. Reassess in a few years.
bootc container lint
