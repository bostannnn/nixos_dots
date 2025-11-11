{ config, pkgs, ... }:

{
  # Basic user info (adjust for your system)
  home.username = "bostan";
  home.homeDirectory = "/home/bostan";

  # Home Manager version (set this to match your Home Manager release)
  home.stateVersion = "25.05";

  # Enable Hyprland
  wayland.windowManager.hyprland = {
    enable = true;

    # Full default config — copied from upstream Hyprland example
    settings = {
      monitor = [
        "DP-1, 3440x1440@179, 0x0, 1, bitdepth, 10, cm, hdr, vrr, 1"
        # Add more monitors here if needed
      ];
	experimental = {
		xx_color_management_v4 = true;
      };

      exec = [		
        "systemctl --user start hyprpolkitagent"
        "QT_SCALE_FACTOR=1.4 noctalia-shell"
        "elephant"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        border_size = 2;
        gaps_in = 5;
        gaps_out = 10;
        layout = "dwindle";
        resize_on_border = true;
        allow_tearing = false;
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(0,0,0,0.5)";
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0,0.35,1"
        ];
        animation = [
          "windows,1,6,default"
          "windowsOut,1,6,default,popin 80%"
          "workspaces,1,4,default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = false;
      };

      # Keybinds
      "$mod" = "SUPER";
      bind = [
			# Main
			"$mod, RETURN, exec, ghostty"
			"$mod, B, exec, firefox"
			"$mod, Q, killactive,"
			"$mod, M, exit,"
			"$mod, E, exec, nautilus"
			"$mod, F, fullscreen,"
			"$mod, SPACE, exec, walker"
			"$mod, J, togglesplit,"
     
			# Workspaces
			"$mod, 1, workspace, 1"  # Open workspace 1
			"$mod, 2, workspace, 2"  # Open workspace 2
			"$mod, 3, workspace, 3"  # Open workspace 3
			"$mod, 4, workspace, 4"  # Open workspace 4
			"$mod, 5, workspace, 5"  # Open workspace 5
			
			"$mod SHIFT, 1, movetoworkspace, 1"  # Move active window to workspace 1
			"$mod SHIFT, 2, movetoworkspace, 2"  # Move active window to workspace 2
			"$mod SHIFT, 3, movetoworkspace, 3"  # Move active window to workspace 3
			"$mod SHIFT, 4, movetoworkspace, 4"  # Move active window to workspace 4
			"$mod SHIFT, 5, movetoworkspace, 5"  # Move active window to workspace 5

      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

}
