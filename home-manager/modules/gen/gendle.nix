{...}: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./packages.nix
  ];
  fonts.fontconfig.enable = true;
}
