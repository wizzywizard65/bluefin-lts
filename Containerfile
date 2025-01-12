FROM ghcr.io/ublue-os/config:latest@sha256:7934dbdc7ffb9163ec7be116a91a8d9ad734e8a22fbf5e44242118fbf1209760 AS config
FROM ghcr.io/centos-workstation/main:${MAJOR_VERSION:-latest}

ARG IMAGE_NAME="${IMAGE_NAME:-achillobator}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-centos-workstation}"
ARG MAJOR_VERSION="${MAJOR_VERSION:-latest}"
ARG SHA_HEAD_SHORT="${SHA_HEAD_SHORT:-}"

COPY system_files /
COPY build_scripts /var/tmp/build_scripts

RUN --mount=type=tmpfs,dst=/tmp --mount=type=bind,from=config,src=/rpms,dst=/tmp/rpms /var/tmp/build_scripts/build.sh
