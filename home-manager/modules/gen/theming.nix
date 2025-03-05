{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../customModules/gen/theming.nix
  ];
  # TODO: Set a module change for all of these easily

  # NOTE: All good aswell as catpuccin-mocha
  # rose-pine-moon's
  # uwunicorn
  # mocha
  # monokai - Somewhat
  services.theming = {
    enable = true;
    wallpaper = "anime-fan.jpg";
    colorScheme = "rose-pine-moon";
    stylix = {
      enable = true;
      polarity = "dark";
      disabledModules = {
        kde.enable = false;
      };
    };
  };
}
