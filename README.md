<img width="3440" height="1440" alt="gscreenshot_2025-11-11-125611" src="https://github.com/user-attachments/assets/adcb12bf-334c-4247-b365-2ed8380f7adf" />
<img width="3440" height="1440" alt="gscreenshot_2025-11-11-125645" src="https://github.com/user-attachments/assets/73ee02ac-e3c6-4d23-bde7-188cba0a2248" />

# NixOS Dotfiles

My personal NixOS configuration files and dotfiles.

What's used:
Patch for Nautilus, so color-schemes are applie dynamically - https://github.com/bostannnn/nautilus-css-hot-reload

Fork of noctalia-shell - https://github.com/bostannnn/noctalia-shell

## Contents

- `/etc/nixos` - NixOS system configuration (flakes, home-manager, etc.)
- `.config` - User configuration files for various applications

## Scripts

### sync-dots.sh - Push Changes to GitHub

Syncs your current configuration files to the repository and pushes to GitHub.

**Usage:**
```bash
# With default commit message (includes timestamp)
./sync-dots.sh

# With custom commit message
./sync-dots.sh "Updated hyprland config"
```

**What it does:**
1. Syncs files from `/etc/nixos` to `etc/nixos/`
2. Syncs files from `~/.config` to `.config/` (excluding cache, logs, and app-specific dirs)
3. Shows what changed
4. Stages all changes
5. Creates a commit (with your message or a default timestamped one)
6. Pushes to GitHub via SSH

**Optional alias:**
```bash
alias sync-dots='/home/bostan/nixos_dots/sync-dots.sh'
```

### apply-dots.sh - Download and Apply Dotfiles

Pulls the latest dotfiles from GitHub and applies them to your machine.

**Usage:**
```bash
./apply-dots.sh
```

**What it does:**
1. Pulls latest changes from GitHub
2. Asks for confirmation before overwriting files
3. Syncs `~/.config` from repo to your home directory
4. Syncs `/etc/nixos` from repo to system (requires sudo)
5. Reminds you to run `sudo nixos-rebuild switch` if needed

**Use cases:**
- Setting up dotfiles on a new machine
- Restoring configs after a system reinstall
- Syncing configs across multiple machines
- Rolling back to a previous configuration

## Typical Workflow

**On machine A (make changes and push):**
```bash
./sync-dots.sh "Updated theme settings"
```

**On machine B (pull and apply):**
```bash
./apply-dots.sh
```

**After applying NixOS config changes:**
```bash
sudo nixos-rebuild switch
```
