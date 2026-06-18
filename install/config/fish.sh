if [[ "$(basename "$SHELL")" == "fish" ]] || getent passwd "$USER" | grep -q fish; then
  if ! command -v fish &>/dev/null; then
    echo "Fish shell detected but not installed — installing..."
    omarchy-pkg-add fish
  fi
fi
