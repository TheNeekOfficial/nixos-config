{ self, ... }:
{
  imports = [
    ./kdeconnectfirewall.nix
    ./gen/gendle.nix
  ];
}
