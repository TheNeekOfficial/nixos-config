{
  pkgs,
  config,
  ...
}: {
  programs = {
    kitty.enable = true;
    alacritty.enable = true;
  };
}
