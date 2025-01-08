{ config, wallpapers, ... }:

let 
  nix-wallpaper = "${wallpapers.wallpapers.path}/nixos-wallpaper-catppuccin-mocha.png";
  cloudy-wallpaper = "${wallpapers.wallpapers.path}/anime-cloudy.png";
  beach-wallpaper = "${wallpapers.wallpapers.path}/anime-beach.jpeg";
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
        nix-wallpaper
        cloudy-wallpaper
        beach-wallpaper
      ];

        # Sets the wallpapers
      wallpaper = [
        ", ${beach-wallpaper}"
      ];
    };
  };
}
