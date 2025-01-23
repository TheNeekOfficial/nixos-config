{pkgs, ...}: {
  environment.systemPackages = with pkgs; [system-config-printer];
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      carps-cups
      canon-cups-ufr2
      canon-capt
      # cups-bjnp # NOTE: 0.8 versions ood
      gutenprintBin
      cnijfilter2
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # NOTE: Allows network sharing of default printer
  services.printing = {
    listenAddresses = ["*:631"];
    allowFrom = ["all"];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };
  services.avahi = {
    # enable = true;
    # nssmdns4 = true;
    # openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };

  # NOTE: Example wireless
  # hardware.printers = {
  #   ensurePrinters = [
  #     {
  #       name = "Dell_1250c";
  #       location = "Home";
  # NOTE: Wireless
  #       deviceUri = "http://192.168.178.2:631/printers/Dell_1250c";
  # NOTE: wired
  # deviceUri = "usb://Dell/1250c%20Color%20Printer?serial=YNP023240";
  #       model = "drv:///sample.drv/generic.ppd";
  #       ppdOptions = {
  #         PageSize = "A4";
  #       };
  #     }
  #   ];
  #   ensureDefaultPrinter = "Dell_1250c";
  # };
}
