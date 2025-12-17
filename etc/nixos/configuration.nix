# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').
# https://taproom.cider.sh/taps
# https://github.com/SteamAchievementNotifier/SteamAchievementNotifier
# https://github.com/hiddify/hiddify-app/releases/latest/download/Hiddify-Linux-x64.AppImage
{ config, pkgs, stable, noctalia, lib, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.nix-path = [ "nixos-config=/etc/nixos" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  boot.kernel.sysctl."kernel.unprivileged_userns_clone" = 1;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Display Manager
  services.displayManager.gdm.enable = true;

  # Desktop Environments
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.wayland = true;
  services.gnome.core-apps.enable = false;

  # Gamepad support
  hardware.steam-hardware.enable = true;
  hardware.uinput.enable = true;

  # Exclude packages
  environment.gnome.excludePackages = [ pkgs.gnome-tour ];
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Time zone
  time.timeZone = "Europe/Moscow";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  

  # Services
  services.printing.enable = false;
  services.geoclue2.enable = true;

  # Sound with PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # User account
  users.users.bostan = {
    isNormalUser = true;
    description = "bostan";
    extraGroups = [ "networkmanager" "wheel" "docker"];
      shell = pkgs.fish;
    packages = with pkgs; [
      # thunderbird
    ];
  };

  # Automatic login (disabled)
  services.displayManager.autoLogin.enable = false;
  # services.displayManager.autoLogin.user = "bostan";

  # Workaround for GNOME autologin (only needed if autoLogin.enable = true)
  # systemd.services."getty@tty1".enable = false;
  # systemd.services."autovt@tty1".enable = false;

  # System auto-upgrade
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Programs
  programs.firefox.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.walker.enable = true;
  
programs.gamescope = {
  enable = true;
  capSysNice = true;  # Better performance scheduling
};

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;  # Enables full gamescope session
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  programs.throne = {
  enable = true;
  tunMode.enable = true;
};

  programs.fish.enable = true;
  programs.starship.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
  
  virtualisation.docker.enable = true;

  # https://nixos.org/nixos/options.html
  system.stateVersion = "25.05";
}
