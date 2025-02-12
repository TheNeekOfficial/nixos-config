# Not in nixos/modules/bundle.nix
{...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
}
