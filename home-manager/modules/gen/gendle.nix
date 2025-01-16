{...}: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./packages.nix
  ];
  # Enables font config
  fonts.fontconfig.enable = true;
}
