# To unblock kdeconnect from firewall
{pkgs, ...}: {
  # Enables kdeconnect
  programs.kdeconnect.enable = true;

  # Unblocks it from firewall
  networking.firewall = rec {
    enable = true;

    # KDE Connect ports
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];

    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
