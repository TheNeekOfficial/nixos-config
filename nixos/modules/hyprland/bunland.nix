# Not in nixos/modules/bundle.nix
{...}: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./gnome-keyring.nix
    ./gammastep.nix
    ./hyprpanel.nix
  ];
}
