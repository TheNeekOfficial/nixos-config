# Doesnt work, RIP
{ self, pkgs, ...}:
{
  environment.systemPackages = [
    pkgs.fprintd-tod
    # pkgs.libfprint-tod
  ];
  services.fprintd = {
    enable = true;
    package = pkgs.fprintd-tod;
  };
  # NOTE: My fingerprint sensor info
  # Bus 003 Device 002: ID 1c7a:0584 LighTuning Technology Inc. ETU905A88-E
}
