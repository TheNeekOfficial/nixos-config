{inputs, ...}: {
  # Imports stylix
  imports = [inputs.stylix.nixosModules.stylix ../../customModules/gen/theming.nix];
  services.theming = {
    enable = true;
    wallpaper = "anime-fan.jpg";
    stylix = {
      enable = true;
      polarity = "dark";
      colorScheme = "uwunicorn";
      # disabledModules = {
      #   kde.enable = false;
      # };
    };
  };
}
