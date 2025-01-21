{
  pkgs,
  inputs,
  ...
}: {
  stylix = let
    wallpaper = inputs.wallpapers.wallpapers.path;
  in {
    enable = true;

    # image = "${wallpaper}/nixos-wallpaper-catppuccin-mocha.png";
    # image =  "${wallpaper}/anime-cloudy.jpeg";
    # image = "${wallpaper}/anime-beach.jpeg";
    image = "${wallpaper}/horimiya-hori-4k.png";

    # Sets style to dark by default
    polarity = "dark";

    # Sets style to catppuccin-mocha to match wallpaper
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
