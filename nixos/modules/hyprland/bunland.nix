# Not in nixos/modules/bundle.nix
{ ... }:
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
  ];
}
