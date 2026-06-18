#!/bin/bash
# Rearchy — hardware-agnostic Hyprland config layer
# Fork of omarchy (basecamp/omarchy), stripped of drivers and OS-specific setup

REARCHY_REF="${REARCHY_REF:-main}"
REARCHY_REPO="${REARCHY_REPO:-leonardo-ferioli/rearchy}"
REARCHY_DIR="$HOME/.local/share/rearchy"

ansi_art='
 ▄▄▄▄▄▄    ▄▄▄▄▄▄▄▄     ▄▄     ▄▄▄▄▄▄       ▄▄▄▄   ▄▄    ▄▄ ▄▄▄    ▄▄▄
 ██▀▀▀▀██  ██▀▀▀▀▀▀    ████    ██▀▀▀▀██   ██▀▀▀▀█  ██    ██  ██▄  ▄██
 ██    ██  ██          ████    ██    ██  ██▀       ██    ██   ██▄▄██
 ███████   ███████    ██  ██   ███████   ██        ████████    ▀██▀
 ██  ▀██▄  ██         ██████   ██  ▀██▄  ██▄       ██    ██     ██
 ██    ██  ██▄▄▄▄▄▄  ▄██  ██▄  ██    ██   ██▄▄▄▄█  ██    ██     ██
 ▀▀    ▀▀▀ ▀▀▀▀▀▀▀▀  ▀▀    ▀▀  ▀▀    ▀▀▀    ▀▀▀▀   ▀▀    ▀▀     ▀▀
                                                                      '

clear
echo -e "$ansi_art"

if [[ -d "$REARCHY_DIR" ]]; then
  echo "Updating rearchy..."
  git -C "$REARCHY_DIR" pull --quiet
else
  echo "Cloning rearchy from: https://github.com/${REARCHY_REPO}.git"
  git clone "https://github.com/${REARCHY_REPO}.git" "$REARCHY_DIR"
  git -C "$REARCHY_DIR" fetch origin "${REARCHY_REF}" && git -C "$REARCHY_DIR" checkout "${REARCHY_REF}"
fi

echo -e "\nInstallation starting..."
source "$REARCHY_DIR/install.sh"
