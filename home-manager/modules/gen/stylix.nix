{inputs, ...}: {
  imports = [
    ../../customModules/gen/theming.nix
    inputs.stylix.homeManagerModules.stylix
  ];
  services.theming = {
    enable = true;
    wallpaper = "horimiya-hori-4k.png";
    stylix = {
      enable = true;
      colorScheme = "catppuccin-mocha";
      polarity = "dark";
      disabledModules = {
        kde.enable = false;
      };
    };
  };
}
