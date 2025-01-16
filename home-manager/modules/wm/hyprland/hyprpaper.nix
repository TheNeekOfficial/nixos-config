{inputs, ...}: let
  nix-wallpaper = "${inputs.wallpapers.wallpapers.path}/nixos-wallpaper-catppuccin-mocha.png";
  cloudy-wallpaper = "${inputs.wallpapers.wallpapers.path}/anime-cloudy.png";
  beach-wallpaper = "${inputs.wallpapers.wallpapers.path}/anime-beach.jpeg";
in {
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
