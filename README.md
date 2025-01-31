# Bluefin LTS (Alpha)
*Achillobator giganticus*

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/13d42ded3cf54250a71ad05aca7d5961)](https://app.codacy.com/gh/ublue-os/bluefin-lts/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![Build Image](https://github.com/ublue-os/bluefin-lts/actions/workflows/build-image.yml/badge.svg)](https://github.com/ublue-os/bluefin-lts/actions/workflows/build-image.yml)

Larger, more lethal [Bluefin](https://projectbluefin.io). `bluefin:lts` is built on CentOS Stream10.

![image](https://github.com/user-attachments/assets/2e160934-44e6-4aee-b2b8-accb3bcf0a41)

# Purpose and Status

## Check [docs.projectbluefin.io/lts](http://docs.projectbluefin.io/lts) for more information.

![image](https://github.com/user-attachments/assets/48985776-7a94-4138-bf00-d2df7824047d)

### Existing Users

If you used the previous **Achillobator prorotype image** you _must_ rebase to the new image. 

**DO NOT REBASE TO THIS IMAGE FROM AN EXISTING BLUEFIN, AURORA, OR BAZZITE SYSTEM**

    sudo bootc rebase ghcr.io/ublue-os/bluefin:lts

### Installation and Caveats

1. Snag the ISO: [download.projectbluefin.io/bluefin-lts.iso](https://download.projectbluefin.io/bluefin-lts.iso)
2. On first boot, install flatpaks: `ujust install-system-flatpaks`
  
[Incoming anaconda PR](https://github.com/rhinstaller/anaconda/pull/6056) for the flatpaks, also:

- Do not rebase to this from an existing Fedora image, ain't no one testing that. Also the filesystems are going to be different, etc. We recommend a VM for now
- Some packages are missing until they get added to the EPEL10 repos.
  - Developer tools are included, -dx split will come later
  - No nvidia builds until Nvidia publishes EL10 drivers
- No akmods or other hwe has been added

## Building

To build locally and then spit out a VM: 

```
just build
just build-iso ghcr.io/ublue-os/bluefin:lts
```

qcow2 file is written to the `output/` directory. Username and password are `centos`/`centos`
