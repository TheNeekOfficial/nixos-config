{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kdePackages.qtsvg
    kdePackages.qtmultimedia
    kdePackages.qtvirtualkeyboard
    (pkgs.callPackage ./sddm-astronaut-theme.nix {
      theme = "hyprland_kath";
    })
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];
    theme = "sddm-astronaut-theme";
  };
}
