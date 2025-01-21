{inputs, ...}: let
  wallpaper = inputs.wallpapers.wallpapers.path;
  nix = "${wallpaper}/nixos-wallpaper-catppuccin-mocha.png";
  japan = "${wallpaper}/japan-fuji.png";
  beach = "${wallpaper}/anime-beach.jpeg";
  # NOTE: Waifus
  marin = "${wallpaper}/marin-school-4k.jpg";
  hori = "${wallpaper}/horimiya-hori-4k.png";
in {
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      # Loads the wallpapers
      preload = [
        # nix
        # japan
        # beach
        # marin
        hori
      ];

      # Sets the wallpapers
      wallpaper = [
        ", ${hori}"
      ];
    };
  };
}
