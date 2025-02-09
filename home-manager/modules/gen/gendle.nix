{...}: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./packages.nix
    ./kdeconnect.nix
    ./vieb.nix
  ];
  # Enables font config
  fonts.fontconfig.enable = true;
}
