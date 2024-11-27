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
            "$mod, ENTER, exec, kitty"
            #"$mod SHIFT, ENTER exec, alacritty"
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
}
