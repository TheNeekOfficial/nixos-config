{
  self,
  config,
  ...
}: {
  imports = [
    ./waybar-config.nix
    ./css/waybar-css-bundle.nix
    ./waybarapps.nix
  ];
}
