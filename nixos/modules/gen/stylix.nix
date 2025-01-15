{inputs, ...}: {
  # Imports stylix
  imports = [inputs.stylix.nixosModules.stylix ../../../mixed/stylix.nix];
}
