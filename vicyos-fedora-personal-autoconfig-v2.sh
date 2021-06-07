#!/bin/bash

# github.com/felipendc

# First thing first: Go to Software and enable the repos that will suit my needs!

# Update
sudo dnf check-update -y
sudo dnf upgrade --refresh -y

# Step 1: Configure RPMfusion Yum Repository (It downloads RPM PKGS and its own dependencies)!
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Visual Studio Code:
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf check-update -y

# dnf packages:
sudo dnf install -y flatpak
sudo dnf install -y dnf-plugin-system-upgrade 
sudo dnf install -y google-chrome-stable 
sudo dnf install -y gnome-tweaks 
sudo dnf install -y inkscape 
sudo dnf install -y code 
sudo dnf install -y brasero 
sudo dnf install -y qbittorrent 
sudo dnf install -y mesa-libGLU-devel.x86_64
sudo dnf install -y mesa-libGLU 
sudo dnf install -y clipgrab 
sudo dnf install -y qwinff 
sudo dnf install -y vlc 
sudo dnf install -y gstreamer1-libav 
sudo dnf install -y ffmpeg
sudo dnf install -y clementine
sudo dnf install -y filezilla
sudo dnf install -y wine
sudo dnf install -y deepin-screenshot
sudo dnf install -y simplescreenrecorder
sudo dnf install -y deepin-screen-recorder
sudo dnf install -y VirtualBox	

# YUM PKGS:

# Onlyoffice:
sudo yum install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
sudo yum install epel-release
sudo yum check-update 
sudo yum update 
sudo yum install -y onlyoffice-desktopeditors 
sudo yum install -y fuse-exfat


############### I need to set it up, later!
sudo flatpak install -y FLATPAK/com.discordapp.Discord.flatpakref
sudo flatpak install -y FLATPAK/net.codeindustry.MasterPDFEditor.flatpakref
sudo flatpak install -y FLATPAK/org.clementine_player.Clementine.flatpakref
sudo flatpak install -y FLATPAK/org.gimp.GIMP.flatpakref
sudo flatpak install -y FLATPAK/org.kde.kdenlive.flatpakref
sudo flatpak install -y FLATPAK/org.kde.krita.flatpakref
sudo flatpak install -y FLATPAK/org.telegram.desktop.flatpakref
sudo flatpak install -y FLATPAK/fr.handbrake.ghb.flatpakref
#sudo flatpak install -y FLATPAK/org.videolan.VLC.flatpakref
#sudo flatpak install -y FLATPAK/org.qbittorrent.qBittorrent.flatpakref
#sudo flatpak install -y FLATPAK/org.filezillaproject.Filezilla.flatpakref
#sudo flatpak install -y FLATPAK/org.inkscape.Inkscape.flatpakref
#sudo flatpak install -y FLATPAK/com.visualstudio.code.flatpakref
#sudo flatpak install -y FLATPAK/com.gitlab.bitseater.meteo.flatpakref
#sudo flatpak install -y FLATPAK/org.onlyoffice.desktopeditors.flatpakref
#sudo flatpak install -y FLATPAK/com.hamrick.VueScan.flatpakref


# Install pkgs rpm:

# Winff from fedora 30
cd ramdon
sudo sudo rpm -i winff-1.5.5-9.1.x86_64.rpm
cd ../

cd ramdon
wget https://release.axocdn.com/linux/gitkraken-amd64.rpm
sudo rpm -i gitkraken-amd64.rpm
sudo rm -R *gitkraken-amd64*
cd ../

#########################################
### Run scripts and install packages ####
#########################################

######### Set my favorite picture as background wallpaper:
cd vicyos-background-wallpaper
sudo cp -R *.jpg /usr/share/backgrounds/fedora-workstation/
gsettings set org.gnome.desktop.background picture-uri "/usr/share/backgrounds/fedora-workstation/macos-big-sur-apple-layers-fluidic-colorful-wwdc-stock-4096x2304-1455.jpg"
cd ../

# Install XDownloader Manager: 
cd random && tar -xf xdm*.tar.xz  && sudo ./install.sh && rm -r install.sh readme.txt && cd ../

# Install SoundCloud Downloader:
#cd scdl && sudo pip3 install scdl && cd ../

# Install Intel Screen Tearing fix:
#cd vicyos-fedora-screen-tearing-for-intel-fix && sudo sh ./vicyos-install-linux-screen-tearing-fix.sh && #cd ../

# Set Github email and nickname:
sudo sh ./upall/setup-git-v1.sh




################# THEME ######################

# Install WhiteSur-gtk-theme on Fedora 34

# Original github:
#git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

# Vicyos BK
git clone https://github.com/felipendc/vicyos-WhiteSur-gtk-theme-backup.git

# cd WhiteSur-gtk-theme
cd vicyos-WhiteSur-gtk-theme-backup
sudo dnf install gtk-murrine-engine
sudo dnf install glib2-devel
sudo dnf install ImageMagick
sudo dnf install dialog
sudo dnf install optipng

sudo ./install.sh
sudo ./install.sh -i fedora
sudo ./tweaks.sh -f

# Dash to Dock
#./tweaks.sh -d
#./tweaks.sh -d -c dark
sudo ./tweaks.sh -g

cd ../

sudo rm -R vicyos-WhiteSur-gtk-theme-backup
# sudo rm -R WhiteSur-gtk-theme


# Apple cursor
mkdir ~/.icons/
sudo cp -Rv Big_Sur_theme/apple_icons/* ~/.icons/

# Icons for all users
sudo cp -Rv Big_Sur_theme/apple_icons/* /usr/share/icons

# Icons for folders
mkdir ~/.local/share/icons
sudo cp -Rv Big_Sur_theme/WhiteSur-icon-theme/* ~/.local/share/icons


# TO WRAP IT UP, REBOOT THE COMPUTER, IF NOTHING HAS HAPPENED, USE THE GNOME TWEAK TOOLS TO APPLY THE THEME.
####################### DCONFIG ######################

# Auto Apply Gnome Tweak Tool configs: (Will keep getting Rolling updates!) (If anything goes wrong, it'll break the system!)

#The files altered by gnome-tweak-tool are saved at: ~/.config/dconf/user 
#(this is the dconf database, a binary file where most user settings are #stored)
#and various other configuration files under ~/.config (these are all text files)
cd vicyos-fedora34-dconf 
sudo rm -r ~/.config/dconf/user
cp -r user* ~/.config/dconf/
cd ../

# Move my personal .bashrc file to my HOME folder:
cd fedora-os-personal-bashrc && sudo cp -r .bashrc* ~/ && cd ../

# NVIDIA
# https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/


##### DOTFILES

cd dotfiles 
cp -Rv Code ~/.config/
cd ../
















