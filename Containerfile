ARG MAJOR_VERSION="${MAJOR_VERSION:-latest}"
FROM ghcr.io/ublue-os/config:latest@sha256:69fc2336720c1b2774d2c984a1ea2005612f0507a24de60a15e9564aca1d835c AS config
FROM quay.io/centos-bootc/centos-bootc:$MAJOR_VERSION

ARG IMAGE_NAME="${IMAGE_NAME:-achillobator}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-centos-workstation}"
ARG MAJOR_VERSION="${MAJOR_VERSION:-latest}"
ARG SHA_HEAD_SHORT="${SHA_HEAD_SHORT:-}"

COPY system_files /
COPY build_scripts /var/tmp/build_scripts

RUN --mount=type=tmpfs,dst=/tmp --mount=type=bind,from=config,src=/rpms,dst=/tmp/rpms /var/tmp/build_scripts/build.sh
