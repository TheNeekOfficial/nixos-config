{ config, wallpapers, ... }:

let 
  wallpaper = "${wallpapers.wallpapers.path}/nixos-wallpaper-catppuccin-mocha.png";
in
{
  services.hyprpaper = {
    enable = true; 

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

        # Loads the wallpapers
      preload = [ 
        wallpaper
      ];

        # Sets the wallpapers
      wallpaper = [
        ", ${wallpaper}"
      ];
    };
  };
}
