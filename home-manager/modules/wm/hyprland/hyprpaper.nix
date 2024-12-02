{ config, wallpapers, ... }:

let 
  wallpaper = ~/.wallpapers/nixos-wallpaper-catppucin-mocha.png;
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
        "${wallpaper}"
      ];

        # Sets the wallpapers
      wallpaper = [
        , ${wallpaper}"
      ];
    };
  };
}
