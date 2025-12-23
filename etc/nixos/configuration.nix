# NixOS Configuration
# https://nixos.org/nixos/options.html
{ config, pkgs, stable, noctalia, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./storage.nix
  ];

  # ═══════════════════════════════════════════════════════════════════════════
  # Nix Settings
  # ═══════════════════════════════════════════════════════════════════════════

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      nix-path = [ "nixos-config=/etc/nixos" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
    optimise.automatic = true;
  };

  nixpkgs.config.allowUnfree = true;

  # ═══════════════════════════════════════════════════════════════════════════
  # Boot & Kernel
  # ═══════════════════════════════════════════════════════════════════════════

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_cachyos;
    kernel.sysctl."kernel.unprivileged_userns_clone" = 1;
    supportedFilesystems = [ "ntfs" ];
  };

  # ═══════════════════════════════════════════════════════════════════════════
  # Networking
  # ═══════════════════════════════════════════════════════════════════════════

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # ═══════════════════════════════════════════════════════════════════════════
  # Localization
  # ═══════════════════════════════════════════════════════════════════════════

  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  # ═══════════════════════════════════════════════════════════════════════════
  # Desktop Environment & Display
  # ═══════════════════════════════════════════════════════════════════════════

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    excludePackages = [ pkgs.xterm ];
  };

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.desktopManager.gnome.enable = true;

  services.gnome = {
    gnome-keyring.enable = true;
    core-apps.enable = false;
  };

  environment.gnome.excludePackages = [ pkgs.gnome-tour ];

  # ═══════════════════════════════════════════════════════════════════════════
  # Audio
  # ═══════════════════════════════════════════════════════════════════════════

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # ═══════════════════════════════════════════════════════════════════════════
  # Hardware
  # ═══════════════════════════════════════════════════════════════════════════

  hardware = {
    steam-hardware.enable = true;
    uinput.enable = true;
  };

  # ═══════════════════════════════════════════════════════════════════════════
  # Security
  # ═══════════════════════════════════════════════════════════════════════════

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.login.enableGnomeKeyring = true;
    pam.services.gdm.enableGnomeKeyring = true;
  };

  # ═══════════════════════════════════════════════════════════════════════════
  # User
  # ═══════════════════════════════════════════════════════════════════════════

  users.users.bostan = {
    isNormalUser = true;
    description = "bostan";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.fish;
  };

  # ═══════════════════════════════════════════════════════════════════════════
  # Programs
  # ═══════════════════════════════════════════════════════════════════════════

  programs = {
    fish.enable = true;
    starship.enable = true;

    firefox.enable = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    walker.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };

    throne = {
      enable = true;
      tunMode.enable = true;
    };
  };

  # ═══════════════════════════════════════════════════════════════════════════
  # Services
  # ═══════════════════════════════════════════════════════════════════════════

  services.geoclue2.enable = true;
  services.printing.enable = false;

  # ═══════════════════════════════════════════════════════════════════════════
  # Virtualization
  # ═══════════════════════════════════════════════════════════════════════════

  virtualisation.docker.enable = true;

  # ═══════════════════════════════════════════════════════════════════════════
  # Packages
  # ═══════════════════════════════════════════════════════════════════════════

# System packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    wget
    git
    fastfetch
    neofetch
    superfile
    starship
    gparted
    loupe
    unzip
    qt6.qtmultimedia
    imagemagick
    gpu-screen-recorder
    claude-code
    codex
    grim
    slurp
    satty        # annotation tool
    wl-clipboard
    libnotify
    realesrgan-ncnn-vulkan
    jq           # for window mode

    # Terminal & shell
    ghostty
    socat

    # Hyprland & Wayland
    swww
    ffmpeg
    mpvpaper
    walker
    egl-wayland
    hyprcursor
    rose-pine-hyprcursor
    swaynotificationcenter
    grim
    gscreenshot
    waypaper
    xdotool
    ollama-cuda
    lmstudio

    # Apps
    telegram-desktop
    gimp
    protonplus
    nautilus
    nautilus-python
    taskwarrior3
    gnome-text-editor
    file-roller
    gearlever
    timeshift
    fragments
    rubik
    cava
    sushi
    godotPackages_4_4.godot
    baobab
    gamescope
    gamescope-wsi

    # Theming & Qt/GTK
    pywalfox-native
    qt6Packages.qt6ct
    adwaita-qt6
    adw-gtk3
    nwg-look

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu

    # Polkit
    lxqt.lxqt-policykit
    polkit
    stable.lxde.lxsession

    # GNOME Extensions
    gnomeExtensions.tiling-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.burn-my-windows
    gnomeExtensions.just-perfection
    gnomeExtensions.open-bar
    gnomeExtensions.middle-click-to-close-in-overview
    gnomeExtensions.vitals
    gnomeExtensions.simple-workspaces-bar
    gnomeExtensions.space-bar
    nautilus-open-any-terminal

    # Flake inputs
    inputs.noctalia.packages.${system}.default
    inputs.matugen.packages.${system}.default
    inputs.quickshell.packages.${system}.default
    inputs.caelestia-shell.packages.${system}.default
  ];


  # ═══════════════════════════════════════════════════════════════════════════
  # System
  # ═══════════════════════════════════════════════════════════════════════════

  system.stateVersion = "25.05";
}

