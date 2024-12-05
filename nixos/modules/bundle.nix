{ self, ... }:
{
  imports = [
    ./autogc.nix
    ./genlimit.nix
    ./kdeconnectfirewall.nix
    ./nh.nix
    ./stylix.nix
    ./packages.nix
  ];
}
