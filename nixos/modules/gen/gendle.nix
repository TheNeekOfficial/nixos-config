{self, pkgs, ... }:
{
  imports = [
    ./autogc.nix
    ./genlimit.nix
    ./nh.nix
    ./stylix.nix
    ./packages.nix
    ./nerdfont.nix
    ./bluetooth.nix
    ./flake-nix.nix
    ./sddm.nix
  ];
}
