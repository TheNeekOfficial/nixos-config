{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.dolphin
    libreoffice
    onlyoffice-desktopeditors
    lazygit
  ];
}
