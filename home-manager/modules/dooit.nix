{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # HM module for dooit
    inputs.dooit.homeManagerModules.default
  ];

  # Adds dooit extras to pkgs
  nixpkgs.overlays = [inputs.dooit-extras.overlay];

  programs.dooit = {
    enable = true;
    extraPackages = [pkgs.dooit-extras];
  };
}
