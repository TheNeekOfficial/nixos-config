{ pkgs, config, ...}:
{
  # Taken off the internet to try and make work
  home.packages = with pkgs; [
    # Base hyprland
    hyprland
    wayland
    xwayland
    mesa
    wlroots

    #Network
    networkmanagerapplet
    #gnome-keyring

    #Apps
    rofi
    #waybar
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
          #"waybar"
        ];

        # Sets keybindings for things
        bind =
          [
            # apps
            "$mod, W, exec, firefox"
            "$mod, Return, exec, kitty"
            "$mod SHIFT, Return, exec, alacritty"
            "$mod, SPACE, exec, rofi -show run"
            "$mod, E, exec, dolphin"
            "$mod ALT, E, exec, system-settings"

            # Window control
            "$mod, q, killactive,"
            "$mod, F, fullscreen"
            "$mod SHIFT, F, togglefloating,"

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
          ]

          # workspaces: binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          ++ builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              ) 
          9);
        
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
