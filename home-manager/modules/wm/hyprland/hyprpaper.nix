{ config, self, wallpapers, ... }:

{
  services.hyprpaper.enable = true; 
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    # Loads the wallpapers
    preload = [ 
      "wallpapers.nixos-wallpaper-catppuccin-moca.png"
    ];

    # Sets the wallpapers
    wallpaper = [
      " , wallpapers.nixos-wallpaper-catppuccin-mocha.png"
    ];
  };
}
