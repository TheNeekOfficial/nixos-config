{...}: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./packages.nix
    ./kdeconnect.nix
  ];
  # Enables font config
  fonts.fontconfig.enable = true;
}
