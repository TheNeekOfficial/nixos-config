{inputs, ...}: let
  nix-wallpaper = "${inputs.wallpapers.wallpapers.path}/nixos-wallpaper-catppuccin-mocha.png";
  japan-wallpaper = "${inputs.wallpapers.wallpapers.path}/japan-fuji.png";
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
        japan-wallpaper
        beach-wallpaper
      ];

      # Sets the wallpapers
      wallpaper = [
        ", ${japan-wallpaper}"
      ];
    };
  };
}
