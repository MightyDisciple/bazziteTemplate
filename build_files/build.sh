#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y \
  alacritty \
  dotnet-sdk-8.0 \
  niri \
  qt6ct \
  fuse \
  fuse-libs

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y --enable-repo=terra install \
    noctalia-shell

# install Godot
install -Dm644 /ctx/icons/godot.png \
  /usr/share/icons/hicolor/256x256/apps/godot.png
  
install -Dm644 /ctx/desktop/godot.desktop \
  /usr/share/applications/godot.desktop
  
/ctx/install_godot.sh

#### Example for enabling a System Unit File

systemctl enable podman.socket
