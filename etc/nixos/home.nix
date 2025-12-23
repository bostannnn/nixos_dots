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
  
 
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-decoration-layout = "";
    };

    gtk4.extraConfig = {
      gtk-decoration-layout = "";
    };
  };

  
  home.packages = with pkgs; [
  python3
];
  # User configuration
  home.username = "bostan";
  home.homeDirectory = "/home/bostan";
 services.polkit-gnome.enable = true;
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
  
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        extraOptions = {
          AddKeysToAgent = "yes";
        };
      };
      "github.com" = {
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  programs.firefox = {
  enable = true;
  profiles.default = {
    settings = {
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "browser.urlbar.suggest.quicksuggest.sponsored" = false;
      "browser.newtabpage.activity-stream.topSitesRows" = 2;
    };
  };
};

  # programs.fish.shellInit = ''
  # '';
  
  # Home Manager state version
  home.stateVersion = "25.05";
}
