# Install rearchy SDDM theme
SDDM_THEME_SRC="$OMARCHY_PATH/default/sddm/rearchy"
SDDM_THEME_DEST="/usr/share/sddm/themes/rearchy"

sudo mkdir -p "$SDDM_THEME_DEST"
sudo cp -r "$SDDM_THEME_SRC/." "$SDDM_THEME_DEST/"

# Setup SDDM wayland session
sudo mkdir -p /usr/local/share/wayland-sessions
sudo cp "$OMARCHY_PATH/default/wayland-sessions/rearchy.desktop" /usr/local/share/wayland-sessions/rearchy.desktop
sudo cp "$OMARCHY_PATH/default/sddm/hyprland.lua" /usr/share/sddm/hyprland.lua
sudo rm -f /usr/share/sddm/hyprland.conf

sudo mkdir -p /etc/sddm.conf.d
cat <<EOF | sudo tee /etc/sddm.conf.d/10-wayland.conf >/dev/null
[General]
DisplayServer=wayland

[Wayland]
CompositorCommand=start-hyprland -- --config /usr/share/sddm/hyprland.lua
EOF

if [[ ! -f /etc/sddm.conf.d/autologin.conf ]]; then
  cat <<EOF | sudo tee /etc/sddm.conf.d/autologin.conf
[Autologin]
User=$USER
Session=rearchy

[Theme]
Current=rearchy
EOF
else
  sudo sed -i 's/^Session=\(omarchy\|hyprland-uwsm\)$/Session=rearchy/' /etc/sddm.conf.d/autologin.conf
  sudo sed -i 's/^Current=omarchy$/Current=rearchy/' /etc/sddm.conf.d/autologin.conf
fi

# Prevent password-based SDDM logins from creating an encrypted login keyring
sudo sed -i '/-auth.*pam_gnome_keyring\.so/d' /etc/pam.d/sddm
sudo sed -i '/-password.*pam_gnome_keyring\.so/d' /etc/pam.d/sddm

sudo systemctl enable sddm.service
