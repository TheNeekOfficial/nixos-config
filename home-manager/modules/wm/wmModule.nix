{...}: {
  imports = [../../customModules/wm/hyprland/hyprland.nix];
  services.wm.hyprland = {
    enable = true;
    hyprlock = {
      enable = true;
      background = {
        wallpaper = "japan-fuji.jpg";
        blurSize = 8;
        blurPasses = 3;
        force = true;
      };
    };
    hyprpaper = {
      enable = true;
    };
    hypridle = {
      enable = true;
      settings = {
        general = {
          ignore_dbus_inhibit = false;
          # NOTE: Defaults:
          # lock command
          # Before sleep command
        };
      };
    };
    hyprpanel = {
      enable = true;
      # TODO: Fix so default works
      theme = "rose_pine_moon";
      execOnce = true;
      overwritePanelFile = true;
    };
  };
  services.theming.stylix.disabledModules.hyprlock.enable = false;
}
