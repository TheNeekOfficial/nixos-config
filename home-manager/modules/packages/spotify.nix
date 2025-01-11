{ self, pkgs, ...}:
{
  home.packages = with pkgs; [
    spotify
    playerctl
  ];
}
