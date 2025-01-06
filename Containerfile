FROM ghcr.io/ublue-os/config:latest@sha256:f136ef45a6fb050d6abeb1541e6e0e00ac5962c2ed78b3aeda20030d85c8ce10 AS config
FROM ghcr.io/centos-workstation/main:${MAJOR_VERSION:-latest}

ARG IMAGE_NAME="${IMAGE_NAME:-achillobator}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-centos-workstation}"
ARG MAJOR_VERSION="${MAJOR_VERSION:-latest}"
ARG SHA_HEAD_SHORT="${SHA_HEAD_SHORT:-}"

COPY system_files /
COPY build.sh /tmp/build.sh

RUN --mount=type=bind,from=config,src=/rpms,dst=/tmp/rpms ln -sf /run /var/run && \
    mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    dnf clean all && \
    ostree container commit 

RUN bootc container lint
