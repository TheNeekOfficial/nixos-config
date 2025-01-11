# Doesnt work, RIP
{ self, pkgs, ...}:
{
  # NOTE: Doesn't work at all

  environment.systemPackages = [
    pkgs.fprintd
  ];

  # NOTE: Starts driver at boot
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };

  # NOTE: Installs driver
  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-vfs0090 ; # NOTE: Wrong driver
    };
  };

  # NOTE: My fingerprint sensor info
  # Bus 003 Device 002: ID 1c7a:0584 LighTuning Technology Inc. ETU905A88-E
}
