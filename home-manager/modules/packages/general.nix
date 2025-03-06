{pkgs, ...}: {
  home.packages = with pkgs; [
    yazi
    kdePackages.dolphin
    libreoffice
    onlyoffice-desktopeditors
    lazygit
    nix-tour
  ];
}
