abort() {
  echo -e "\e[31mRearchy install requires: $1\e[0m"
  echo
  gum confirm "Proceed anyway?" || exit 1
}

# Must be any Arch-based distro
if [[ ! -f /etc/arch-release ]]; then
  abort "Arch-based distro (Arch, CachyOS, EndeavourOS, etc.)"
fi

# Must not be running as root
if (( EUID == 0 )); then
  abort "Running as non-root user"
fi

# Must be x86_64
if [[ $(uname -m) != "x86_64" ]]; then
  abort "x86_64 CPU"
fi

# Must not have GNOME or KDE already installed
if pacman -Qe gnome-shell &>/dev/null || pacman -Qe plasma-desktop &>/dev/null; then
  abort "No existing GNOME or KDE desktop"
fi

echo "Guards: OK"
