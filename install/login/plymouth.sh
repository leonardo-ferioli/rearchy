if ! command -v plymouth &>/dev/null; then
  echo "Plymouth not found — installing..."
  omarchy-pkg-add plymouth
fi

if [[ $(plymouth-set-default-theme) != "rearchy" ]]; then
  sudo mkdir -p /usr/share/plymouth/themes/rearchy
  sudo cp -r "$OMARCHY_PATH/default/plymouth/." /usr/share/plymouth/themes/rearchy/
  sudo plymouth-set-default-theme rearchy
fi
