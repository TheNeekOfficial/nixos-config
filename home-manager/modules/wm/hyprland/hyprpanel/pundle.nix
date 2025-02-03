{inputs, ...}: {
  nixpkgs.overlays = [inputs.hyprpanel.overlay];
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    ./hyprpanel.nix
    ./setup.nix
  ];
}
