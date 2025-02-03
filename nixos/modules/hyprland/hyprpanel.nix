{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.hyprpanel.overlay];
  environment.systemPackages = with pkgs; [hyprpanel];
  services.upower.enable = true;
}
