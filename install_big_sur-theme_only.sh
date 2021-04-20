

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
cp -Rv Big_Sur_theme/WhiteSur-icon-theme/* ~/.local/share/icons


# TO WRAP IT UP, REBOOT THE COMPUTER, IF NOTHING HAS HAPPENED, USE THE GNOME TWEAK TOOLS TO APPLY THE THEME.






