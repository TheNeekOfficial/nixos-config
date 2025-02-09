{
  pkgs,
  inputs,
  lib,
  ...
}: {
  nixpkgs.overlays = [inputs.hyprpanel.overlay];
  environment.systemPackages = with pkgs; [hyprpanel];
  services.upower.enable = true;
  services.tlp = lib.mkForce {enable = false;};
  services.power-profiles-daemon.enable = true;
}
