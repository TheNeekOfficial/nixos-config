# NOTE: Don't use w/ auto-cpufreq
{ self, ... }:
{
  # NOTE: Should work out of box
  # If need specific config check here https://nixos.wiki/wiki/Laptop#tlp
  services.tlp = {
    enable = true;

    # NOTE: Trying to fix battery stopping charging at 79%
    settings = {
      STOP_CHARGE_THRESH_BAT0 = 100; 
    };
  };
}
