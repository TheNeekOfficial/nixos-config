{pkgs, ...}: {
  home.packages = with pkgs; [
    vieb
    neovide
    qutebrowser
  ];
  # home.file.".config/Vieb/viebrc" = [
  #   text = ...
  # ];
}
