# Not in nixos/modules/bundle.nix
{self, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
}
