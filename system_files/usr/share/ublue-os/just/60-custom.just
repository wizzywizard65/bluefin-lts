install-system-flatpaks:
    #!/usr/bin/env bash
    xargs flatpak --system -y install --or-update < /etc/ublue-os/system-flatpaks.list

bluefin-cli:
    /usr/libexec/ublue-bling
