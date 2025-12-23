{ pkgs, inputs, ... }:
{
    # =============================================================================
    # NOCTALIA SHELL SETTINGS
    # =============================================================================
    #
    # AVAILABLE BAR WIDGETS:
    # ----------------------
    # "ActiveWindow"       - Shows currently focused window title
    # "AudioVisualizer"    - Audio visualization bars
    # "Battery"            - Battery status and percentage
    # "Bluetooth"          - Bluetooth toggle and status
    # "Brightness"         - Screen brightness control
    # "Clock"              - Date and time display
    # "ControlCenter"      - Quick settings panel launcher
    # "CustomButton"       - Customizable button with commands
    # "DarkMode"           - Toggle dark/light mode
    # "KeepAwake"          - Prevent screen sleep
    # "KeyboardLayout"     - Keyboard layout indicator
    # "LockKeys"           - Caps/Num/Scroll lock indicators
    # "MediaMini"          - Media player controls
    # "Microphone"         - Microphone volume/mute
    # "NightLight"         - Blue light filter toggle
    # "NoctaliaPerformance" - Performance mode toggle
    # "NotificationHistory" - Notification center
    # "PowerProfile"       - Power profile selector
    # "RandomWallpaper"    - Random wallpaper button
    # "ScreenRecorder"     - Screen recording controls
    # "Screenshot"         - Screenshot button
    # "SessionMenu"        - Power/logout menu
    # "Spacer"             - Empty space between widgets
    # "SystemMonitor"      - CPU/RAM/temp stats
    # "Taskbar"            - Running applications
    # "TodoList"           - Taskwarrior integration
    # "Tray"               - System tray icons
    # "Volume"             - Audio volume control
    # "VPN"                - VPN status/toggle
    # "WiFi"               - WiFi status/toggle
    # "WallpaperSelector"  - Wallpaper picker
    # "Workspace"          - Workspace switcher
    #
    # =============================================================================

    programs.noctalia-shell = {
      enable = true;
      settings = {
        settingsVersion = 31;

        # =========================================================================
        # BAR SETTINGS
        # =========================================================================
        bar = {
          position = "left";           # "top", "bottom", "left", "right"
          mode = "framed";             # "classic", "floating", "framed"
          transparent = true;
          showOutline = false;
          monitors = [ ];              # Empty = all monitors
          density = "massive";     # "compact", "default", "comfortable"
          showCapsule = true;
          capsuleOpacity = 1;
          floating = false;            # Legacy, use mode = "floating" instead
          marginVertical = 1;          # Floating mode margins (0-1 ratio)
          marginHorizontal = 0.50;
          outerCorners = true;         # Inverted corners at bar edges
          exclusive = true;            # Reserve space with compositor
          gap = 10;                    # Gap between bar and windows (classic/floating)

          widgets = {
            left = [
              {
                id = "SystemMonitor";
                # Available settings:
                # usePrimaryColor = false;
                # showCpuUsage = true;
                # showCpuTemp = true;
                # showGpuTemp = false;
                # showMemoryUsage = true;
                # showMemoryAsPercent = false;
                # showNetworkStats = false;
                # showDiskUsage = false;
                # diskPath = "/";
              }
              {
                id = "ActiveWindow";
                showIcon = true;
                hideMode = "hidden";       # "hidden", "collapsed", "alwaysExpanded"
                scrollingMode = "hover";   # "hover", "always", "never"
                maxWidth = 145;
                useFixedWidth = false;
                colorizeIcons = false;
              }
              {
                id = "TodoList";
                # Available settings:
                # hideWhenZero = false;
              }
              {
                id = "MediaMini";
                # Available settings:
                # hideMode = "hidden";
                # scrollingMode = "hover";
                # maxWidth = 145;
                # useFixedWidth = false;
                # hideWhenIdle = false;
                # showAlbumArt = false;
                # showArtistFirst = true;
                # showVisualizer = false;
                # showProgressRing = true;
                # visualizerType = "linear";
              }
            ];
            center = [
              {
                id = "Workspace";
                # Available settings:
                # labelMode = "index";           # "index", "name", "icon"
                # followFocusedScreen = false;
                # hideUnoccupied = false;
                # characterCount = 2;
                # showApplications = false;
                showLabelsOnlyWhenOccupied = false;
                colorizeIcons = false;
                # enableScrollWheel = true;
              }
              {
                id = "DarkMode";
              }
              {
                id = "WallpaperSelector";
              }
              {
                id = "RandomWallpaper";
              }
              {
                id = "ScreenRecorder";
              }
              {
                id = "Screenshot";
              }
            ];
            right = [
              {
                id = "Tray";
                # Available settings:
                # blacklist = [];
                # colorizeIcons = false;
                # pinned = [];
                # drawerEnabled = true;
                # hidePassive = false;
              }
              {
                id = "NotificationHistory";
                # Available settings:
                # showUnreadBadge = true;
                # hideWhenZero = true;
              }
              {
                id = "WiFi";
                # Available settings:
                # displayMode = "onhover";   # "onhover", "always", "icononly"
              }
              {
                id = "Volume";
                # Available settings:
                # displayMode = "onhover";
              }
              {
                id = "Clock";
                usePrimaryColor = false;
                # Available settings:
                # useCustomFont = false;
                # customFont = "";
                # formatHorizontal = "HH:mm ddd, MMM dd";
                # formatVertical = "HH mm - dd MM";
              }
              {
                id = "SessionMenu";
                # Available settings:
                # colorName = "error";
              }
            ];
          };
        };

        # =========================================================================
        # GENERAL SETTINGS
        # =========================================================================
        general = {
          avatarImage = "";
          dimmerOpacity = 0.2;
          showScreenCorners = true;
          forceBlackScreenCorners = true;

          # Screen Border (caelestia-style)
          screenBorderEnabled = false;
          screenBorderThickness = 10;
          screenBorderRounding = 25;
          screenBorderMargin = 10;
          screenBorderUseThemeColor = true;
          screenBorderColor = "#1e1e2e";
          screenBorderShadowEnabled = true;
          screenBorderShadowBlur = 15;
          screenBorderShadowOpacity = 0.7;

          # Scaling
          scaleRatio = 1;
          radiusRatio = 1;
          iRadiusRatio = 1;
          boxRadiusRatio = 1;
          screenRadiusRatio = 1;

          # Animation
          animationSpeed = 1;
          animationDisabled = false;

          # Lock screen
          compactLockScreen = false;
          lockOnSuspend = true;
          showSessionButtonsOnLockScreen = true;
          showHibernateOnLockScreen = false;

          # Shadows
          enableShadows = true;
          shadowDirection = "bottom_right";   # "bottom_right", "bottom_left", "top_right", "top_left"
          shadowOffsetX = 2;
          shadowOffsetY = 3;

          language = "";                       # Empty = auto-detect
          allowPanelsOnScreenWithoutBar = true;
        };

        # =========================================================================
        # UI SETTINGS
        # =========================================================================
        ui = {
          fontDefault = "Roboto";
          fontFixed = "DejaVu Sans Mono";
          fontDefaultScale = 1;
          fontFixedScale = 1;
          tooltipsEnabled = true;
          panelBackgroundOpacity = 0.8;
          panelsAttachedToBar = true;
          settingsPanelMode = "centered";      # "centered", "attached", "window"
        };

        # =========================================================================
        # LOCATION & TIME SETTINGS
        # =========================================================================
        location = {
          name = "Moscow";
          weatherEnabled = true;
          weatherShowEffects = true;
          useFahrenheit = false;
          use12hourFormat = false;
          showWeekNumberInCalendar = false;
          showCalendarEvents = true;
          showCalendarWeather = true;
          analogClockInCalendar = false;
          firstDayOfWeek = -1;                 # -1 = auto, 0 = Sunday, 1 = Monday
        };

        # =========================================================================
        # CALENDAR CARDS
        # =========================================================================
        calendar = {
          cards = [
            { enabled = true; id = "calendar-header-card"; }
            { enabled = true; id = "calendar-month-card"; }
            { enabled = true; id = "timer-card"; }
            { enabled = true; id = "weather-card"; }
          ];
        };

        # =========================================================================
        # SCREEN RECORDER
        # =========================================================================
        screenRecorder = {
          directory = "";                      # Empty = ~/Videos
          frameRate = 60;
          audioCodec = "opus";
          videoCodec = "h264";
          quality = "very_high";               # "low", "medium", "high", "very_high"
          colorRange = "limited";              # "limited", "full"
          showCursor = true;
          audioSource = "default_output";      # "default_output", "default_input", "both", "none"
          videoSource = "portal";              # "portal", "wlr"
        };

        # =========================================================================
        # WALLPAPER
        # =========================================================================
        wallpaper = {
          enabled = true;
          overviewEnabled = false;
          directory = "/home/bostan/Pictures/Wallpapers";
          monitorDirectories = [ ];
          enableMultiMonitorDirectories = false;
          recursiveSearch = false;
          setWallpaperOnAllMonitors = true;
          fillMode = "crop";                   # "crop", "fit", "stretch", "center", "tile"
          fillColor = "#000000";
          randomEnabled = false;
          randomIntervalSec = 300;
          transitionDuration = 1500;
          transitionType = "random";           # "fade", "slide", "wipe", "random"
          transitionEdgeSmoothness = 0.05;
          panelPosition = "follow_bar";        # "follow_bar", "center", "top_left", etc.
          hideWallpaperFilenames = false;

          # Wallhaven integration
          useWallhaven = false;
          wallhavenQuery = "";
          wallhavenSorting = "relevance";      # "relevance", "random", "date_added", "views", "favorites"
          wallhavenOrder = "desc";             # "desc", "asc"
          wallhavenCategories = "111";         # "general,anime,people" as binary
          wallhavenPurity = "100";             # "sfw,sketchy,nsfw" as binary
          wallhavenResolutionMode = "atleast"; # "atleast", "exact"
          wallhavenResolutionWidth = "";
          wallhavenResolutionHeight = "1440";
        };

        # =========================================================================
        # APP LAUNCHER
        # =========================================================================
        appLauncher = {
          enableClipboardHistory = false;
          enableClipPreview = true;
          position = "center";                 # "center", "top_left", "top_right", "bottom_left", "bottom_right", "bottom_center", "top_center"
          pinnedExecs = [ ];
          useApp2Unit = false;
          sortByMostUsed = true;
          terminalCommand = "xterm -e";
          customLaunchPrefixEnabled = false;
          customLaunchPrefix = "";
          viewMode = "list";                   # "list", "grid"
          showCategories = true;
        };

        # =========================================================================
        # CONTROL CENTER
        # =========================================================================
        controlCenter = {
          position = "close_to_bar_button";    # "close_to_bar_button", "center", "top_left", etc.
          shortcuts = {
            left = [
              { id = "WiFi"; }
              { id = "Bluetooth"; }
              { id = "ScreenRecorder"; }
              { id = "WallpaperSelector"; }
            ];
            right = [
              { id = "Notifications"; }
              { id = "PowerProfile"; }
              { id = "KeepAwake"; }
              { id = "NightLight"; }
            ];
          };
          cards = [
            { enabled = true; id = "profile-card"; }
            { enabled = true; id = "shortcuts-card"; }
            { enabled = true; id = "audio-card"; }
            { enabled = false; id = "brightness-card"; }
            { enabled = true; id = "weather-card"; }
            { enabled = true; id = "media-sysmon-card"; }
          ];
        };

        # =========================================================================
        # SYSTEM MONITOR THRESHOLDS
        # =========================================================================
        systemMonitor = {
          cpuWarningThreshold = 80;
          cpuCriticalThreshold = 90;
          tempWarningThreshold = 80;
          tempCriticalThreshold = 90;
          gpuWarningThreshold = 80;
          gpuCriticalThreshold = 90;
          memWarningThreshold = 80;
          memCriticalThreshold = 90;
          diskWarningThreshold = 80;
          diskCriticalThreshold = 90;
          cpuPollingInterval = 3000;
          tempPollingInterval = 3000;
          gpuPollingInterval = 3000;
          enableNvidiaGpu = true;              # Enabled for RTX 5080 desktop
          memPollingInterval = 3000;
          diskPollingInterval = 3000;
          networkPollingInterval = 3000;
          useCustomColors = false;
          warningColor = "";
          criticalColor = "";
        };

        # =========================================================================
        # DOCK
        # =========================================================================
        dock = {
          enabled = false;
          displayMode = "always_visible";      # "always_visible", "auto_hide", "exclusive"
          backgroundOpacity = 1;
          floatingRatio = 1;
          size = 1;
          onlySameOutput = true;
          monitors = [ ];
          pinnedApps = [ ];
          colorizeIcons = true;
          pinnedStatic = false;
          inactiveIndicators = false;
          deadOpacity = 0.6;
        };

        # =========================================================================
        # NETWORK
        # =========================================================================
        network = {
          wifiEnabled = true;
        };

        # =========================================================================
        # SESSION MENU
        # =========================================================================
        sessionMenu = {
          enableCountdown = true;
          countdownDuration = 10000;
          position = "center";
          showHeader = true;
          largeButtonsStyle = false;
          powerOptions = [
            { action = "lock"; enabled = true; }
            { action = "suspend"; enabled = true; }
            { action = "hibernate"; enabled = true; }
            { action = "reboot"; enabled = true; }
            { action = "reboot-windows"; enabled = true; }
            { action = "logout"; enabled = true; }
            { action = "shutdown"; enabled = true; }
          ];
        };

        # =========================================================================
        # NOTIFICATIONS
        # =========================================================================
        notifications = {
          enabled = true;
          monitors = [ ];
          location = "top_right";              # "top_right", "top_left", "bottom_right", "bottom_left", "top_center", "bottom_center"
          overlayLayer = true;
          backgroundOpacity = 1;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
          enableKeyboardLayoutToast = true;
          sounds = {
            enabled = false;
            volume = 0.5;
            separateSounds = false;
            criticalSoundFile = "";
            normalSoundFile = "";
            lowSoundFile = "";
            excludedApps = "discord,firefox,chrome,chromium,edge";
          };
        };

        # =========================================================================
        # ON-SCREEN DISPLAY
        # =========================================================================
        osd = {
          enabled = true;
          location = "top_right";
          autoHideMs = 2000;
          overlayLayer = true;
          backgroundOpacity = 1;
          enabledTypes = [
            0  # Volume
            1  # Brightness
            2  # Mic mute
            4  # Keyboard layout
          ];
          monitors = [ ];
        };

        # =========================================================================
        # AUDIO
        # =========================================================================
        audio = {
          volumeStep = 5;
          volumeOverdrive = false;
          cavaFrameRate = 30;
          visualizerType = "linear";           # "linear", "circular"
          visualizerQuality = "high";          # "low", "medium", "high"
          mprisBlacklist = [ ];
          preferredPlayer = "";
          externalMixer = "pwvucontrol || pavucontrol";
        };

        # =========================================================================
        # BRIGHTNESS
        # =========================================================================
        brightness = {
          brightnessStep = 5;
          enforceMinimum = true;
          enableDdcSupport = false;            # External monitor DDC/CI control
        };

        # =========================================================================
        # COLOR SCHEMES
        # =========================================================================
        colorSchemes = {
          useWallpaperColors = true;
          predefinedScheme = "Noctalia (default)";
          darkMode = true;
          schedulingMode = "on";               # "off", "on", "auto"
          manualSunrise = "06:30";
          manualSunset = "18:30";
          matugenSchemeType = "random";        # "scheme-content", "scheme-expressive", "scheme-fidelity", "scheme-fruit-salad", "scheme-monochrome", "scheme-neutral", "scheme-rainbow", "scheme-tonal-spot", "random"
          generateTemplatesForPredefined = true;
        };

        # =========================================================================
        # TEMPLATES (App theming via matugen)
        # =========================================================================
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
          telegram = true;
          cava = true;
          yazi = false;
          emacs = false;
          niri = false;
          hyprland = true;
          zed = false;
          enableUserTemplates = false;
        };

        # =========================================================================
        # NIGHT LIGHT
        # =========================================================================
        nightLight = {
          enabled = false;
          forced = false;
          autoSchedule = true;
          nightTemp = "4000";
          dayTemp = "6500";
          manualSunrise = "06:30";
          manualSunset = "18:30";
        };

        # =========================================================================
        # HOOKS (Custom scripts on events)
        # =========================================================================
        hooks = {
          enabled = false;
          wallpaperChange = "";
          darkModeChange = "";
          screenLock = "";
          screenUnlock = "";
        };

        # =========================================================================
        # DESKTOP WIDGETS
        # =========================================================================
        desktopWidgets = {
          enabled = false;
          editMode = false;
          monitorWidgets = [ ];
          # Format: [{ name = "DP-1"; widgets = [...]; }]
        };
      };
  };
}
