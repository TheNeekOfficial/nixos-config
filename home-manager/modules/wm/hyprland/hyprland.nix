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
    wofi
    waybar
    hyprpaper
  ];

  # WM
  # Hyprland
  
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      # Sets package to the hyprland git
      #package = inputs.hyprland.packages.${nixpkgs.legacyPackages.x86_64-linux.stdenv.hostPlatform.system}.hyprland;

      settings = {
        # Allows windows key to be used
        "$mod" = "SUPER";

        # Exec on startup
        exec-once = [
          "nm-applet --indicator & disown"
          "gammastep-indicator"
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

            # Window control
            "$mod, q, killactive"
            "ALT, F4, killactive" # As an alt way
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

            # Exit Hypr
            "$mod, M, exit"
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
