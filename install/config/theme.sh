if ! pacman -Qi yaru-icon-theme &>/dev/null; then
  echo "yaru-icon-theme not found — installing..."
  omarchy-pkg-add yaru-icon-theme gnome-themes-extra
fi

if ! pacman -Qi hyprland &>/dev/null; then
  echo "Hyprland not found — installing..."
  omarchy-pkg-add hyprland uwsm hypridle hyprlock hyprsunset hyprpicker waybar mako swaybg
fi

# Set links for Nautilus action icons
sudo mkdir -p /usr/share/icons/Yaru/scalable/actions
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-previous-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-previous-symbolic.svg
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-next-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-next-symbolic.svg

# Setup user theme folder
mkdir -p ~/.config/omarchy/themes

# Chromium policy directory for theme
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed

# Set initial theme (only if desktop session is available)
if [[ -n "$DBUS_SESSION_BUS_ADDRESS" ]] || [[ -n "$WAYLAND_DISPLAY" ]]; then
  omarchy-theme-set "Tokyo Night"
else
  echo "No desktop session detected — theme will be applied on first login"
  mkdir -p ~/.config/omarchy/current
  ln -snf "$OMARCHY_PATH/themes/tokyo-night" ~/.config/omarchy/current/theme 2>/dev/null || true
fi
rm -rf ~/.config/chromium/SingletonLock # otherwise archiso will own the chromium singleton

# Set specific app links for current theme
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omarchy/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/omarchy/current/theme/mako.ini ~/.config/mako/config

# Default Chromium to follow system appearance ("device") instead of dark
if [[ -d /usr/lib/chromium ]]; then
  echo '{"browser":{"theme":{"color_scheme":0,"color_scheme2":0}}}' | sudo tee /usr/lib/chromium/initial_preferences >/dev/null
fi
