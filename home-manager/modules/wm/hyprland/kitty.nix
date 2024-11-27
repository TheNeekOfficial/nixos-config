{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    # Hyprland
    kitty
    alacritty
  ];
  programs.kitty.enable = true;
  programs.alacritty.enable = true;

}
