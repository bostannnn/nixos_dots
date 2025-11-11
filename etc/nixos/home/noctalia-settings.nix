{ pkgs, noctalia, ... }:

{
  
    programs.noctalia-shell = {
      enable = true;
      settings = {
        settingsVersion = 21;
        setupCompleted = false;
        bar = {
          position = "left";
          backgroundOpacity = 0.80;
          monitors = [ ];
          density = "comfortable";
          showCapsule = true;
          floating = true;
          marginVertical = 1;
          marginHorizontal = 0.50;
          outerCorners = true;
          exclusive = true;
          widgets = {
            left = [
              {
                id = "SystemMonitor";
              }
					{
						id = "ActiveWindow";
						showIcon = true;
						hideMode = "hidden";
						scrollingMode = "hover";
						width = 245;
						colorizeIcons = false;
						}
              {
                id = "MediaMini";
              }
            ];
            center = [
              {
                id = "Workspace";
              }
					{
                id = "DarkMode";
              }
               {
                id = "WallpaperSelector";
              }
            ];
            right = [
            {
                id = "Taskbar";
              }
              {
                id = "Tray";
              }
              {
                id = "NotificationHistory";
              }
              {
                id = "Volume";
              }
              {
                id = "Clock";
              }
                            {
                id = "SessionMenu";
              }
            ];
          };
        };
        general = {
          avatarImage = "";
          dimDesktop = true;
          showScreenCorners = true;
          forceBlackScreenCorners = false;
          scaleRatio = 1;
          radiusRatio = 1;
          screenRadiusRatio = 1;
          animationSpeed = 1;
          animationDisabled = false;
          compactLockScreen = false;
          lockOnSuspend = true;
          enableShadows = true;
          shadowDirection = "bottom_right";
          shadowOffsetX = 2;
          shadowOffsetY = 3;
          language = "";
        };
        ui = {
          fontDefault = "Roboto";
          fontFixed = "DejaVu Sans Mono";
          fontDefaultScale = 1;
          fontFixedScale = 1;
          tooltipsEnabled = true;
          panelsAttachedToBar = true;
          settingsPanelAttachToBar = false;
        };
        location = {
          name = "Tokyo";
          weatherEnabled = true;
          useFahrenheit = false;
          use12hourFormat = false;
          showWeekNumberInCalendar = false;
          showCalendarEvents = true;
          showCalendarWeather = true;
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
        };
        screenRecorder = {
          directory = "";
          frameRate = 60;
          audioCodec = "opus";
          videoCodec = "h264";
          quality = "very_high";
          colorRange = "limited";
          showCursor = true;
          audioSource = "default_output";
          videoSource = "portal";
        };
        wallpaper = {
          enabled = true;
          overviewEnabled = false;
          directory = "/home/bostan/Pictures/Wallpapers";
          enableMultiMonitorDirectories = false;
          recursiveSearch = false;
          setWallpaperOnAllMonitors = true;
          defaultWallpaper = "";
          fillMode = "crop";
          fillColor = "#000000";
          randomEnabled = true;
          randomIntervalSec = 300;
          transitionDuration = 1500;
          transitionType = "random";
          transitionEdgeSmoothness = 0.05;
          monitors = [ ];
          panelPosition = "follow_bar";
        };
        appLauncher = {
          enableClipboardHistory = false;
          position = "center";
          backgroundOpacity = 1;
          pinnedExecs = [ ];
          useApp2Unit = false;
          sortByMostUsed = true;
          terminalCommand = "xterm -e";
          customLaunchPrefixEnabled = false;
          customLaunchPrefix = "";
        };
        controlCenter = {
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "ScreenRecorder";
              }
              {
                id = "WallpaperSelector";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "PowerProfile";
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
            ];
          };
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
        };
        dock = {
          enabled = true;
          displayMode = "always_visible";
          backgroundOpacity = 1;
          floatingRatio = 1;
          size = 1;
          onlySameOutput = true;
          monitors = [ ];
          pinnedApps = [ ];
          colorizeIcons = true;
        };
        network = {
          wifiEnabled = true;
        };
        notifications = {
          enabled = true;
          monitors = [ ];
          location = "top_right";
          overlayLayer = true;
          backgroundOpacity = 1;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
        };
        osd = {
          enabled = true;
          location = "top_right";
          monitors = [ ];
          autoHideMs = 2000;
          overlayLayer = true;
        };
        audio = {
          volumeStep = 5;
          volumeOverdrive = false;
          cavaFrameRate = 30;
          visualizerType = "linear";
          visualizerQuality = "high";
          mprisBlacklist = [ ];
          preferredPlayer = "";
        };
        brightness = {
          brightnessStep = 5;
          enforceMinimum = true;
          enableDdcSupport = false;
        };
        colorSchemes = {
          useWallpaperColors = true;
          predefinedScheme = "Noctalia (default)";
          darkMode = true;
          schedulingMode = "on";
          manualSunrise = "06:30";
          manualSunset = "18:30";
          matugenSchemeType = "scheme-fruit-salad";
          generateTemplatesForPredefined = true;
        };
        templates = {
          gtk = true;
          qt = true;
          kcolorscheme = true;
          alacritty = false;
          kitty = false;
          ghostty = true;
          foot = false;
          wezterm = false;
          fuzzel = false;
          discord = false;
          pywalfox = true;
          vicinae = false;
          walker = true;
          code = false;
          spicetify = false;
          enableUserTemplates = false;
          discord_vesktop = false;
          discord_webcord = false;
          discord_armcord = false;
          discord_equibop = false;
          discord_lightcord = false;
          discord_dorion = false;
        };
        nightLight = {
          enabled = false;
          forced = false;
          autoSchedule = true;
          nightTemp = "4000";
          dayTemp = "6500";
          manualSunrise = "06:30";
          manualSunset = "18:30";
        };
        hooks = {
          enabled = false;
          wallpaperChange = "";
          darkModeChange = "";
        };
        battery = {
          chargingMode = 0;
        };
      };
    };
}

