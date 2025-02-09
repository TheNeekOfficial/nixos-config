{pkgs, ...}: {
  home.packages = with pkgs; [
    vieb
    neovide
  ];
  # home.file.".config/Vieb/viebrc" = [
  #   text = ...
  # ];
}
