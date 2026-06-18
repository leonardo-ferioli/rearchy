if grep -q '\[omarchy\]' /etc/pacman.conf 2>/dev/null; then
  echo "omarchy repo already configured"
  exit 0
fi

# Import omarchy GPG key
sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

# Append omarchy repo to existing pacman.conf
sudo tee -a /etc/pacman.conf >/dev/null <<'EOF'

[omarchy]
SigLevel = Optional TrustAll
Server = https://pkgs.omarchy.org/stable/$arch
EOF

sudo pacman -Sy --noconfirm
