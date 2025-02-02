{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages = with pkgs; [
    spotify
    playerctl
    spotify-player
  ];
}
