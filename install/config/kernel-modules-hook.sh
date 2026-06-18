if ! pacman -Qi kernel-modules-hook &>/dev/null; then
  echo "kernel-modules-hook not found — installing..."
  omarchy-pkg-add kernel-modules-hook
fi

chrootable_systemctl_enable linux-modules-cleanup.service
