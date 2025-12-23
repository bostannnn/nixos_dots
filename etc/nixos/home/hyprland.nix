{ config, inputs, pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ~/.config/hypr/noctalia.conf
      source = ~/.config/noctalia/hypr-gaps.conf
    '';
    settings = {
      "$mod" = "SUPER";
      monitor = [
        ", 3440x1440@179, 0x0, 1"
      ];
      env = [
        "NIXOS_OZONE_WL,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "GBM_BACKEND,nvidia-drm"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "SSH_AUTH_SOCK,$XDG_RUNTIME_DIR/keyring/ssh"
      ];
      exec-once = [
        "gnome-keyring-daemon --start --components=secrets,ssh,pkcs11"
        "swww-daemon"
        "noctalia-shell"
        "elephant"
        "steam"
        "Throne"
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
      experimental = {
        xx_color_management_v4 = true;
      };
      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = false;
        vrr = 1;
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
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ''$mod, S, exec, sh -lc 'mkdir -p "$HOME/Pictures/Screenshots"; f="$HOME/Pictures/Screenshots/screenshot-$(date +%F-%H%M%S).png"; if grim "$f"; then (wl-copy < "$f" >/dev/null 2>&1 || true); notify-send --app-name=Screenshot --category=screenshot "Screenshot Saved" "$f" --icon="$f" --hint=string:image-path:"$f" -t 5000; fi' ''
        ''$mod SHIFT, S, exec, sh -lc 'mkdir -p "$HOME/Pictures/Screenshots"; f="$HOME/Pictures/Screenshots/screenshot-$(date +%F-%H%M%S).png"; if grim -g "$(slurp -d)" "$f"; then (wl-copy < "$f" >/dev/null 2>&1 || true); notify-send --app-name=Screenshot --category=screenshot "Screenshot Saved" "$f" --icon="$f" --hint=string:image-path:"$f" -t 5000; fi' ''
        ''$mod CTRL, S, exec, sh -lc 'mkdir -p "$HOME/Pictures/Screenshots"; f="$HOME/Pictures/Screenshots/screenshot-$(date +%F-%H%M%S).png"; geom="$(hyprctl activewindow -j | jq -r '[.at[0],.at[1],.size[0],.size[1]]|@tsv' | awk '{printf "%s,%s %sx%s",$1,$2,$3,$4}')"; if grim -g "$geom" "$f"; then (wl-copy < "$f" >/dev/null 2>&1 || true); notify-send --app-name=Screenshot --category=screenshot "Screenshot Saved" "$f" --icon="$f" --hint=string:image-path:"$f" -t 5000; fi' ''
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindr = [
        "SUPER, SUPER_L, exec, noctalia-shell ipc call launcher toggle"
      ];
        bindel = [
    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
  ];
    };
  };
}
