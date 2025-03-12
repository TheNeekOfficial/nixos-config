{...}: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./packages.nix
    ./kdeconnect.nix
    ./browser.nix
    ./xmpp.nix
    ./theming.nix
    ./betterBase.nix
  ];
  # Enables font config
  fonts.fontconfig.enable = true;
}
