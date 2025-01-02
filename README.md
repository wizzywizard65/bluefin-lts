# Achillobator

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/13d42ded3cf54250a71ad05aca7d5961)](https://app.codacy.com/gh/centos-workstation/achillobator/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![Build Image](https://github.com/centos-workstation/achillobator/actions/workflows/build-image.yml/badge.svg)](https://github.com/centos-workstation/achillobator/actions/workflows/build-image.yml)

Larger, more lethal Bluefin. `bluefin:lts` prototype built on CentOS Stream10.

![image](https://github.com/user-attachments/assets/2e160934-44e6-4aee-b2b8-accb3bcf0a41)

# Purpose and Status

This is not a 1:1 recreation, it's a minimal product, see below for more information: 

![image](https://github.com/user-attachments/assets/48985776-7a94-4138-bf00-d2df7824047d)

### Installation and Caveats

1. Snag the ISO: [download.projectbluefin.io/achillobator.iso](https://download.projectbluefin.io/achillobator.iso)
2. On first boot, install flatpaks: `ujust install-system-flatpaks`
3. Automatic updates aren't working, you need to: `sudo bootc upgrade` by hand for now.
  
[Incoming anaconda PR](https://github.com/rhinstaller/anaconda/pull/6056) for the flatpaks, also:

- Do not rebase to this from an existing Fedora image, ain't no one testing that. Also the filesystems are going to be different, etc. We recommend a VM for now
- Not working on nvidia, -dx, etc. at this time as we wait for packages to populate into the EPEL10 repos.
- The URL _will change_ in the future, this is a temporary image, eventually will be pushed to `ublue-os/bluefin:lts`, but not any time soon.
- No akmods or other hwe has been added

## Rationale

With most of my user facing life being in my browser and flatpak, a slower cadenced OS has a proven use case. With `bootc` being a critical piece of RHEL image mode, it means that stack in CentOS will be well maintained. And with the flexibility of the container model, we can source content from anywhere. This is a spike to see if it's worth adding this as a `bluefin:lts` branch, or worse case, a starting point for someone who wants to grow a community around this use case. 

- GNOME47 will be shipping, we have builds for our stuff already
- 6.12 LTS kernel covers Framework's current laptops, we can source newer kernels for different tags later, but this should be great for 2025.
- Is there going to be a reliable GNOME COPR for El10?

## Building

To build locally and then spit out a VM: 

```
just build
just build-iso ghcr.io/centos-workstation/achillobator:latest
```

qcow2 file is written to the `output/` directory. Username and password are `centos`/`centos`

## Current Ideas

- hyperscale sig provides newer kernels, we don't need to stay old old.
- EPEL will fill in lots of stuff
- Long lived and boring, we expect even less maintenance than Fedora-based Bluefin

## Other Examples

- [HeliumOS](https://codeberg.org/HeliumOS)
- Valentin Rothberg - [fedora-bootc-workstation](https://github.com/vrothberg/fedora-bootc-workstation/tree/main)
