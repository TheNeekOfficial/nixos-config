# NOTE: Sets cursor correctly except for some apps ie. Firefox Liferea
{
  pkgs,
  lib,
  ...
}: let
  cursor = pkgs.catppuccin-cursors.mochaMauve;
  cursor_name = "Catppuccin Mocha Mauve";
in {
  home.packages = with pkgs; [
    cursor
    xdg-desktop-portal-gtk
  ];
  gtk.cursorTheme = {
    name = cursor_name;
    package = cursor;
  };
  home.pointerCursor = lib.mkForce {
    package = cursor;
    name = cursor_name;
    x11.defaultCursor = cursor_name;
  };
}
