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
    waybar
    hyprpaper
    waypaper

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
        "nm-applet --indicator & disown"
        "blueman-applet"
        "gammastep-indicator"
        "dunst"
        "sleep 1 && waybar"
        "wofi"
        "hyprpaper"
        # NOTE: Don't include hypridle as activated w/ ./hypridle.nix OTHERWISE IT WILL BREAK SYSTEM
        "kitty"
      ];

      # Sets keybindings for things
      bind = [
        # apps
        "$mod, W, exec, firefox"
        "$mod, Return, exec, kitty"
        "$mod SHIFT, Return, exec, alacritty"
        "$mod, SPACE, exec, wofi --show run"
        "$mod, E, exec, dolphin"
        "$mod ALT, E, exec, systemsettings"
        "$mod, D, exec, vesktop"
        "$mod ALT, W, exec, waypaper" # GUI wallpaper manager
        "$mod, S, exec, spotify && sleep 2 && playerctl -p spotify play"

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
        "$mod ALT, p, exec, playerctl -p spotify play-pause" # specifically target spotify w/ alt
        "$mod CTRL, p, exec, playerctl -a pause"
        "$mod CTRL, k, exec, playerctl next" # Means skip to next song
        "$mod CTRL, j, exec, playerctl previous" # Means skip to previous song
        # More under binde

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
        "SHIFT, XF86AudioLowerVolume, exec, playerctl -p spotify volume 0.1-"
        "SHIFT, XF86AudioRaiseVolume, exec, playerctl -p spotify volume 0.1+"

        # Brightness Control
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
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
      windowrulev2 = [
        "opacity 0.9, class:kitty"

        # Sets Picture in Picture to top right and pinned to all screens
        "float, title:(Picture-in-Picture)"
        "size 30% 30%, title:(Picture-in-Picture)"
        "move 1005 31, title:(Picture-in-Picture)"
        "pin, title:(Picture-in-Picture)"
        "noinitialfocus, title:(Picture-in-Picture)"

        # Sets steam to desktop 9
        "workspace 9, title:Steam"

        # Sets kitty to workspace 1
        "workspace 1, class:kitty"

        # Sets discord to desktop 8
        "workspace 8, class:vesktop"

        # Sets firefox to desktop 2
        "workspace 2, class:firefox"

        # Sets spotify to desktop 10
        "workspace 10, class:spotify"
      ];

      dwindle = {
        preserve_split = true;
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
