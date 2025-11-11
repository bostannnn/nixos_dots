{ pkgs, noctalia, inputs, ... }:

{
  # Import additional home modules
  imports = [
		./home/hyprland.nix
		./home/noctalia-settings.nix
		noctalia.homeModules.default   # Import Noctalia module properly
  ];

  # Cursor settings
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  # User configuration
  home.username = "bostan";
  home.homeDirectory = "/home/bostan";

  # Starship prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
  

  # Home Manager state version
  home.stateVersion = "25.05";
}

