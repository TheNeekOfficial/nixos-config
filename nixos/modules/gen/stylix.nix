{inputs, ...}: {
  # Imports stylix
  imports = [inputs.stylix.nixosModules.stylix ../../customModules/gen/theming.nix];
  services.theming = {
    enable = true;
    wallpaper = "horimiya-hori-4k.png";
    stylix = {
      enable = true;
      polarity = "dark";
      colorScheme = "catppuccin-mocha";
      # disabledModules = {
      #   kde.enable = false;
      # };
    };
  };
}
