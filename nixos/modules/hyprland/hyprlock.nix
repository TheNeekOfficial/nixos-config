{ self, pkgs, ... }:
{
  security.pam.services.hyprlock = {};
  # environment.systemPackages = with pkgs; [
  #   # Enables loginctl
  #   elogind
  # ];
}
