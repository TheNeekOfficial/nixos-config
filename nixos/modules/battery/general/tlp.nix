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

      # NOTE: Make Rival 5 mice not suspend after boot
      USB_AUTOSUSPEND = 0;
      USB_ALLOWLIST = "1038:183c";
      RUNTIME_PM_BLACKLIST = "1038:183c";
    };
  };
}
