{ self, ... }:
{
  imports = [
    ./kdeconnectfirewall.nix
    ./nh.nix
    ./stylix.nix
    ./packages.nix
  ];
}
