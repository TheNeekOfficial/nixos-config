# To unblock kdeconnect from firewall
{ config, self, ...}:

{
  networking.firewall = {
    enable = true;

    # KDE Connect ports
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; }
    ];

    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; }
    ];
  };
}

