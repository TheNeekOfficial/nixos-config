{pkgs, ...}: {
  home.packages = with pkgs; [
    vieb
    neovide
    nyxt
  ];
  # home.file.".config/Vieb/viebrc" = [
  #   text = ...
  # ];
}
