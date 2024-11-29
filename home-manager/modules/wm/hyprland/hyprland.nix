{ pkgs, config, ...}:
{
  # WM
  # Hyprland
  
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
        "$mod" = "SUPER";
        bind =
          [
            "$mod, W, exec, firefox"
            #"$mod, ENTER, exec, kitty"
            "$mod, Return, exec, alacritty"
            "$mod, q, killactive,"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
          9)
        );
      };
  };

  # hints Electron apps to use Wayland
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  # Taken off the internet to try and make work
  home.packages = with pkgs; [
    xwayland
  ];


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
