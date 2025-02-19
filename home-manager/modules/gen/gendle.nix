{...}: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./packages.nix
    ./kdeconnect.nix
    ./vieb.nix
    ./xmpp.nix
  ];
  # Enables font config
  fonts.fontconfig.enable = true;
}
