# rearchy

A hardware-agnostic Hyprland configuration layer for any Arch-based distro.

Fork of [omarchy](https://github.com/basecamp/omarchy) — stripped of drivers, hardware detection, and OS-specific setup. Installs dotfiles, themes, and a curated desktop environment on top of your existing system.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/leonardo-ferioli/rearchy/main/boot.sh | bash
```

## Requirements

- Any Arch-based distro (Arch, CachyOS, EndeavourOS, etc.)
- x86_64
- No existing GNOME or KDE session
- Non-root user

## What it does

- Applies Hyprland, Waybar, and full desktop config
- Sets up SDDM with autologin
- Installs Limine bootloader
- Adds the omarchy package repo
- Applies 20+ visual themes
- Does **not** touch your drivers, bluetooth, wifi, or existing system config

## Credits

Built on [omarchy](https://github.com/basecamp/omarchy) by DHH / Basecamp.
