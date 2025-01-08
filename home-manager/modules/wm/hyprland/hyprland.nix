{ pkgs, config, inputs, hyprland, ...}:
{
  home.packages = with pkgs; [
    # Base hyprland
    #hyprland
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

    # Lock Screen
    hyprlock # Works once in hyprland but not on boot
    waypaper
  ];

  # WM
  # Hyprland
  
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      # Sets package to hyprland github
      package = inputs.hyprland.packages.${inputs.nixpkgs.legacyPackages.x86_64-linux.stdenv.hostPlatform.system}.hyprland;

      settings = {
        # Allows windows key to be used
        "$mod" = "SUPER";

        # Exec on startup
        exec-once = [
          "nm-applet --indicator & disown"
	        "blueman-applet & disown"
          "gammastep-indicator"
	        "dunst"
          "sleep 1 && waybar"
          "wofi"
          "hyprpaper"
        ];

        # Sets keybindings for things
        bind =
          [
            # apps
            "$mod, W, exec, firefox"
            "$mod, Return, exec, kitty"
            "$mod SHIFT, Return, exec, alacritty"
            "$mod, SPACE, exec, wofi --show run"
            "$mod, E, exec, dolphin"
            "$mod ALT, E, exec, systemsettings"
            "$mod, D, exec, vesktop"
            "$mod ALT, W, exec, waypaper" # GUI wallpaper manager

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
            # "$mod ALT, j, togglesplit" # No idea what this does
            "$mod, p, pseudo" # Makes screen smaller typa style

            # Waybar open/close
            "$mod, B, exec, pkill -SIGUSR1 waybar"

            # Exit Hypr
            "$mod, M, exit"

            # NOTE: FN keys

            # Volume Control
            ", XF86AudioMute, exec, wpctl set-mute 59 toggle"

            # Mic control cos Fn key doesnt work
            "CTRL, F4, exec, wpctl set-mute 61 toggle"
          ];

        # NOTE: binde = can repeat when held
        binde = [
            # Volume Control
            ", XF86AudioLowerVolume, exec, wpctl set-volume 59 5%-"
            ", XF86AudioRaiseVolume, exec, wpctl set-volume 59 5%+"

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
          "$mod, Control_L, movewindow"
          "$mod, ALT_L, resizewindow"
        ];

        # TODO change on laptop
        #monitor = "Virtual-1,1920x1080@59.96";
      };
  };

  # hints Electron apps to use Wayland
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  # designed for config.nix
  #hardware = {
  #  opengl.enable = true;
  #  nvidia.modesetting.enable = true;
  #};

  #services.xserver = {
  #  enable = true;
  #  videosDrivers = ["nvidia"];
  #  displayManager.gdm = {
  #    enable = true;
  #    wayland = true;
  #  };
  #};
}
