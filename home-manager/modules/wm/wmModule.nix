{lib, ...}: {
  imports = [../../customModules/wm/hyprland/hyprland.nix];
  services.wm.hyprland = lib.mkDefault {
    enable = true;
    hyprlock = {
      enable = true;
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
}
