{ self, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nh
    nix-output-monitor
    nvd
  ];

  environment.sessionVariables = {
    FLAKE = "/home/dylan/nix/nixos-config";
  };
}
