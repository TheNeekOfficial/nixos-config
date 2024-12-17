{ self, ... }:
{
  imports = [
    ./kdeconnectfirewall.nix
    ./gen/gendle.nix
    #./nixvim/nvim.nix
  ];
}
