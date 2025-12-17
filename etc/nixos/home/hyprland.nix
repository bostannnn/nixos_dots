{ config, inputs, pkgs, lib, ... }:
{
  home.username = "bostan";
  home.homeDirectory = "/home/bostan";
  home.stateVersion = "25.05";
  
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/.config/hypr/noctalia.conf
      source = ~/.config/noctalia/hypr-gaps.conf
    '';
    settings = {
      "$mod" = "SUPER";
      monitor = [
        "DP-1, 3440x1440@179, 0x0, 1"
      ];
      env = [
        "NIXOS_OZONE_WL,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];
      exec-once = [
        "swww-daemon"
        "noctalia-shell"
        "elephant"
        "steam"
        "throne"
      ];
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };
      general = {
        border_size = 4;
        # Fallback colors (noctalia.conf will override these)
        "col.active_border" = "rgba(bd93f9ee) rgba(ff79c6ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        gaps_in = 5;
        layout = "dwindle";
        resize_on_border = true;
        allow_tearing = false;
      };
      dwindle = {
        pseudotile = false;
        preserve_split = true;
        smart_split = false;
        smart_resizing = true;
        force_split = 2;
        split_width_multiplier = 1.0;
      };
      decoration = {
        dim_inactive = true;
        dim_strength = 0.1;
        rounding = 25;
            active_opacity = 0.95;
    inactive_opacity = 0.85;
        blur = {
          enabled = true;
    size = 8;
    passes = 3;
    vibrancy = 0.1696;
    new_optimizations = true;
    xray = false;  # set true if you want to see through multiple windows
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
          "borderangle,1,100,default,loop"
        ];
      };
      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = false;
      };
      workspace = [
        "1, monitor:DP-1, persistent:true"
        "2, monitor:DP-1, persistent:true"
        "3, monitor:DP-1, persistent:true"
        "4, monitor:DP-1, persistent:true"
      ];
      windowrulev2 = [
        "workspace 2 silent, class:^(steam)$"
        "workspace 2 silent, class:^(Steam)$"
        "workspace 3, class:^(steam_app_.*)$"
        "fullscreen, class:^(steam_app_.*)$"
        "workspace 4 silent, class:^(throne)$"
        "workspace 4 silent, class:^(Throne)$"
        "noblur, class:^(noctalia-video-wallpaper-.*)$"
        "noshadow, class:^(noctalia-video-wallpaper-.*)$"
        "noborder, class:^(noctalia-video-wallpaper-.*)$"
        "nofocus, class:^(noctalia-video-wallpaper-.*)$"
        "noinitialfocus, class:^(noctalia-video-wallpaper-.*)$"
      ];
      bind = [
        # Main
        "$mod, RETURN, exec, ghostty"
        "$mod, B, exec, firefox"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, nautilus"
        "$mod, F, fullscreen,"
        "$mod, J, togglesplit"
        "$mod, A, togglefloating"
        "$mod, Tab, exec, noctalia-shell ipc call overview toggle"
        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindr = [
        "SUPER, SUPER_L, exec, noctalia-shell ipc call launcher toggle"
      ];
    };
  };
}
