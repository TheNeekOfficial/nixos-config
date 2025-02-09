{inputs, ...}: {
  nixpkgs.overlays = [inputs.hyprpanel.overlay];
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
    # ./extraConfig.nix
    ./hyprpanel.nix
  ];
}
