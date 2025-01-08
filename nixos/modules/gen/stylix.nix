{ inputs, stylix, pkgs, ...}:
{
  #Enables stylix
  stylix.enable = true;

  # Sets wallpaper to nixos mocha one
  # stylix.image = "${inputs.wallpapers.wallpapers.path}/nixos-wallpaper-catppuccin-mocha.png";

  # Sets wallpaper to cloudy anime one
  # stylix.image =  "${inputs.wallpapers.wallpapers.path}/anime-cloudy.jpeg";

  # Sets wallpaper to beach anime one
  stylix.image = "${inputs.wallpapers.wallpapers.path}/anime-beach.jpeg";


  # Sets style to dark by default
  stylix.polarity = "dark";

  # Sets style to catppuccin-mocha to match wallpaper
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
}
