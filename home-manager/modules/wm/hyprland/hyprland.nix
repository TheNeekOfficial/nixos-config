{pkgs, ...}: {
  home.packages = with pkgs; [
    # Base hyprland
    hyprland
    wayland
    xwayland
    mesa
    wlroots

    #Network
    networkmanagerapplet
    blueman

    #gnome-keyring
    # Notifications
    dunst

    #Apps
    wofi
    hyprpaper
    waypaper
    liferea
    spotify-player

    # Lock Screen
    hyprlock # Works once in hyprland but not on boot
    hypridle # Enables idle automation on screen close w/ hyprland

    # Screenshots
    grim
    slurp
    swappy
    wl-clipboard
  ];
  # WM
  # Hyprland

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      # Allows windows key to be used
      "$mod" = "SUPER";

      # Exec on startup
      exec-once = [
        "gammastep-indicator"
        # "dunst"
        # "sleep 1 && waybar"
        "wofi"
        "hyprpaper"
        "waypaper --restore"
        # NOTE: Don't include hypridle as activated w/ ./hypridle.nix OTHERWISE IT WILL BREAK SYSTEM
        "kitty"
      ];

      # Sets keybindings for things
      bind = [
        # apps
        "$mod, W, exec, firefox"
        "$mod, Return, exec, kitty"
        "$mod SHIFT, Return, exec, alacritty"
        "$mod, SPACE, exec, wofi --show drun"
        "$mod, E, exec, dolphin"
        "$mod, D, exec, vesktop"
        "$mod ALT, W, exec, waypaper" # GUI wallpaper manager
        "$mod, S, exec, spotify && sleep 2 && playerctl -p spotify play"
        "$mod ALT, S, exec, kitty --title spotify_player spotify_player" # TUI spotify --title spotify_player
        "$mod, R, exec, liferea" # RSS Reader
        "$mod, G, exec, libremines" # Minesweeper

        # Window control
        "$mod, q, killactive"
        # "ALT, F4, killactive" # As an alt way

        "$mod, F, fullscreen"
        "$mod SHIFT, F, togglefloating,"

        # Workspace switcher binds
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Send active window to N workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "ALT, TAB, workspace, e+1"
        "ALT SHIFT, TAB, workspace, e-1"

        # Moving focus w/ vim keys
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Moving windows w/ vim keys
        "$mod SHIFT, h, swapwindow, l"
        "$mod SHIFT, l, swapwindow, r"
        "$mod SHIFT, k, swapwindow, u"
        "$mod SHIFT, j, swapwindow, d"

        # Dwindle Window layout options
        # also togglesplit as an option but idk what it does
        "$mod, t, pseudo" # Makes screen smaller typa style
        "$mod, c, togglesplit"

        # Waybar open/close
        "$mod, B, exec, pkill -SIGUSR1 waybar"

        # Video/Music playback control
        "$mod, p, exec, playerctl play-pause"
        "$mod ALT, p, exec, playerctl -p spotify -p spotify_player play-pause" # specifically target spotify w/ alt
        "$mod CTRL, p, exec, playerctl -a pause"
        "$mod CTRL, k, exec, playerctl next" # Means skip to next song
        "$mod CTRL, j, exec, playerctl previous" # Means skip to previous song
        # More under binde

        # NOTE: keybind show -- My version -- Not good
        # "$mod, k, exec, echo | hyprctl binds | grep -e 'bind' -e 'modmask' -e 'key:' -e 'arg' | sed 's/modmask: 64/Super/' | sed 's/modmask: 65/Super + Shift/' | sed 's/modmask: 72/Super + Alt/' | sed 's/modmask: 68/Super + CTRL/' | sed 's/modmask: 0/None/' | sed 's/modmask: 1/Shift/' | sed 's/modmask: 8/Alt/' | sed 's/modmask: 9/Alt + Shift/' | sed 's/modmask: 4/CTRL/' | wofi --dmenu"
        "$mod, k, exec, hypr-binds"

        # Exit Hypr
        "$mod, M, exit"

        # NOTE: FN keys

        # Mic control cos Fn key doesnt work
        "CTRL, F4, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        # Screenshots
        # TODO: Get setup w/ correct FN F12 setup
        "CTRL, F12, exec, grim -g \"$(slurp)\" - | swappy -f -"
      ];

      # NOTE: binde = can repeat when held
      binde = [
        # Volume Control
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        # Spotify Volume Control
        "SHIFT, XF86AudioLowerVolume, exec, playerctl -p spotify -p spotify_player volume 0.1-"
        "SHIFT, XF86AudioRaiseVolume, exec, playerctl -p spotify -p spotify_player volume 0.1+"
        # Youtube/Browser Volume Control
        "CTRL, XF86AudioLowerVolume, exec, playerctl -p firefox volume 0.1-"
        "CTRL, XF86AudioRaiseVolume, exec, playerclt -p firefox volume 0.1+"

        # Brightness Control
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
      ];

      # NOTE: bindm = mouse binds
      bindm = [
        # Mouse binds
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"

        # Keyboard binds w/ mouse
        "$mod Control_L, w, movewindow"
        "$mod ALT_L , r, resizewindow"
      ];

      # Rules for windows inc. opacity and where to put them etc.
      # NOTE: WINDOW RULES ^
      windowrulev2 = [
        "opacity 0.9 0.4, class:kitty" # active, inactive

        # Sets Picture in Picture to top right and pinned to all screens
        "opacity 1.0 0.80 override, title:(Picture-in-Picture)" # active vs inactive
        "float, title:(Picture-in-Picture)"
        "size 341 197, title:(Picture-in-Picture)"
        "move 1097 31, title:(Picture-in-Picture)"
        "pin, title:(Picture-in-Picture)"
        "noinitialfocus, title:(Picture-in-Picture)"
        "noblur on, title:(Picture-in-Picture)"
        "xray on, title:(Picture-in-Picture)"

        # Sets youtube opacity to 1
        "opacity 1.0 override 0.9 override, title:(.*)(- YouTube)(.*)"

        # Sets kitty to workspace 1
        "workspace 1, title:kitty"

        # Sets firefox to desktop 2
        "workspace 2, class:firefox"

        # Sets RSS Reader to desktop 3
        "workspace 3, title:Liferea"

        # Sets Class-Notes in Obsidian to desktop 4
        "workspace 4, title:(class-notes)(.*)(Obsidian)(.*)"

        # Sets discord to desktop 8
        "workspace 8, class:vesktop"

        # Sets steam to desktop 9
        "workspace 9, title:Steam"

        # Sets spotify to desktop 10
        "workspace 10, class:spotify"
        "workspace 10, title:spotify_player"
      ];

      # NOTE: allows horizontal and vertical setup
      dwindle = {
        preserve_split = true;
      };

      # NOTE: DECORATIONS
      decoration = {
        # Sets windows to have a rounding radius of n-px
        rounding = 5;

        # Opacities
        active_opacity = 0.9;
        inactive_opacity = 0.6;
        fullscreen_opacity = 1.0;

        # dim_inactive = true;
        # dim_strength = 0.3;
      };
    };

    extraConfig = ''
      bind = $mod CTRL, t, submap, preselect_layout
      submap = preselect_layout
      bind = , H, layoutmsg, preselect l
      bind = , L, layoutmsg, preselect r
      bind = , K, layoutmsg, preselect u
      bind = , J, layoutmsg, preselect d
      bind = , s, exec, hyprctl keyword dwindle:permanent_direction_override false
      bind = $mod, s, exec, hyprctl keyword dwindle:permanent_direction_override true
      bind = , escape, submap, reset
      submap = reset
    '';
  };

  # hints Electron apps to use Wayland
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
