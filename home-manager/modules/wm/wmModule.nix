{lib, ...}: {
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
  };
  services.theming = {
    stylix = {
      disabledModules = {
        hyprlock.enable = false;
      };
    };
  };
}
