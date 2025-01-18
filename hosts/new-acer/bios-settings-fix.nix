{pkgs, ...}: {
  boot.loader.systemd-boot.enable = true;
  environment.systemPackages = with pkgs; [
    efibootmgr
  ];
}
