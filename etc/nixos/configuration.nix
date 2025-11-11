# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

#https://taproom.cider.sh/taps
#https://github.com/SteamAchievementNotifier/SteamAchievementNotifier
#https://github.com/hiddify/hiddify-app/releases/latest/download/Hiddify-Linux-x64.AppImage


{ config, pkgs, stable, noctalia, lib, inputs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			./nvidia.nix

		];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelPackages = pkgs.linuxPackages_cachyos;

	networking.hostName = "nixos"; # Define your hostname.
	
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;
    
 environment.gnome.excludePackages = [ pkgs.gnome-tour ];
 services.xserver.excludePackages = [ pkgs.xterm ];
 
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
	services.printing.enable = false;
	services.geoclue2.enable = true;
	
  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bostan = {
    isNormalUser = true;
    description = "bostan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "bostan";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Install firefox.
  programs.firefox.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.walker.enable = true;

  programs.steam = {
   enable = true;
   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # Xwayland can be disabled.
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   git
   ghostty
   swww
   mpvpaper
   telegram-desktop
   protonplus
   nautilus
   gnome-text-editor
   file-roller
   xdotool
   gearlever
   timeshift
   fastfetch
   neofetch
   stable.hiddify-app
   kdePackages.dolphin
   walker
   egl-wayland
	hyprpolkitagent
   rubik
   nerd-fonts.jetbrains-mono
	nerd-fonts.ubuntu
   socat
   hyprcursor
   rose-pine-hyprcursor
   swaynotificationcenter
   inputs.noctalia.packages.${system}.default
   inputs.matugen.packages.${system}.default
   inputs.quickshell.packages.${system}.default
   inputs.caelestia-shell.packages.${system}.default
   superfile
   pywalfox-native
   libsForQt5.qt5ct
   kdePackages.qt6ct
   adw-gtk3
   adwaita-qt
   adwaita-qt6
   nwg-look
  ];
  
  environment.sessionVariables = {
QT_QPA_PLATFORMTHEME="qt5ct";
};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
