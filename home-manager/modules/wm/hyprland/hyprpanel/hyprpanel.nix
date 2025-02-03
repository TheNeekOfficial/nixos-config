{...}: {
  programs.hyprpanel = {
    enable = true;
    # hyprland.enable = true; # NOTE: Adds to exec-once for hyprland config
    # theme = "catppuccin-mocha"; # NOTE: Not working RN
    overwrite.enable = true;
    layout = {
      "bar.layouts" = {
        "0" = {
          left = ["dashboard" "workspaces" "windowtitle"];
          middle = ["network" "media" "clock" "cpu"];
          right = ["ram" "battery" "volume" "systray" "notifications"];
        };
      };
    };
  };
}
