#!/usr/bin/env bash
#
# 
# SPDX-License-Identifier: GPL-3.0-only
#
# Script to setup an Android 10 build
# environment for Fedora 31 / Rawhide.

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf install -y libdvdcss
sudo dnf install -y \*-firmware

# Packages
sudo dnf install -y \
    @development-tools \
    autoconf213 \
    bison \
    bzip2 \
    ccache \
    curl \
    flex \
    gawk \
    gcc-c++ \
    gcc \
    git \
    bc \
    glibc-devel \
    glibc-static \
    libstdc++-static \
    libX11-devel \
    make \
    mesa-libGL-devel \
    ncurses-devel \
    patch \
    zlib-devel \
    ncurses-devel.i686 \
    readline-devel.i686 \
    zlib-devel.i686 \
    libX11-devel.i686 \
    mesa-libGL-devel.i686 \
    glibc-devel.i686 \
    libstdc++.i686 \
    libXrandr.i686 \
    zip \
    perl-Digest-SHA \
    python2 \
    wget \
    lzop \
    openssl-devel \
    java-1.8.0-openjdk-devel \
    java-1.8.0-openjdk \
    ImageMagick \
    ncurses-compat-libs \
    schedtool \
    lzip \
    vboot-utils \
    vim \
    android-tools \
    syslinux-devel \
    squashfs-tools \
    python3-networkx \
    python-mako \
    ython3-mako \
    python3 \
    python \
    pngcrush \
    optipng \
    maven \
    lz4-libs \
    libxml2-devel \
    ImageMagick-c++-devel.x86_64 \
    ImageMagick-devel.x86_64 \
    kodi-pvr-vuplus \
    glances \
    byobu \
    glances \
    lftp \
    gperf \
    dpkg-dev \
    bzip2-libs \
    automake \
    python3-networkx.noarch \
    python-networkx \
    python3-mako \
    rsync \
    glibc.i686 \
    libXrender.i686 \
    libsx-devel \
    perl-Switch \
    libncurses.so.5 \
    ncurses-libs \
    libtinfo.so.5
    
    
# (No need to creat a symbolic link because libncurses5 is now available on dnf ) Testing!
# The package libncurses5 is not available, so we need to hack our way by symlinking the required library.
#sudo ln -s /usr/lib/libncurses.so.6 /usr/lib/libncurses.so.5
#sudo ln -s /usr/lib/libncurses.so.6 /usr/lib/libtinfo.so.5

# Repo
echo "Installing Git Repository Tool"
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo

echo -e "Setting up udev rules for ADB!"
sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
