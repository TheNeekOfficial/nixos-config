{ pkgs, config, ...}:
{
  # Taken off the internet to try and make work
  home.packages = with pkgs; [
    hyprland
    wayland
    xwayland
    mesa
    wlroots
    rofi
    nm-applet
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
        ];

        # Sets keybindings for things
        bind =
          [
            # apps
            "$mod, W, exec, firefox"
            "$mod, Return, exec, kitty"
            "$mod SHIFT, Return, exec, alacritty"
            "$mod, SPACE, exec, rofi --mode run"
            "$mod, E, exec, dolphin"
            "$mod ALT, E, exec, system-settings"

            # Window control
            "$mod, q, killactive,"
            "$mod, F, fullscreen"
            "$mod SHIFT, F, togglefloating,"
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
