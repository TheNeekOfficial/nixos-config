{...}: {
  boot.loader.systemd-boot.enable = true;
  # environment.systemPackages = with pkgs; [
  #   efibootmgr
  # ];
  # NOTE: DIDN'T DO ANYTHING ^
}
