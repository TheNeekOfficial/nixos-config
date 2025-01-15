{
  pkgs,
  inputs,
  ...
}: {
  stylix = {
    enable = true;

    # Sets wallpaper to nixos mocha one
    # image = "${inputs.wallpapers.wallpapers.path}/nixos-wallpaper-catppuccin-mocha.png";

    # Sets wallpaper to cloudy anime one
    # image =  "${inputs.wallpapers.wallpapers.path}/anime-cloudy.jpeg";

    # Sets wallpaper to beach anime one
    image = "${inputs.wallpapers.wallpapers.path}/anime-beach.jpeg";

    # Sets style to dark by default
    polarity = "dark";

    # Sets style to catppuccin-mocha to match wallpaper
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
