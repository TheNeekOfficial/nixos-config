{
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    vieb
    neovide
    qutebrowser
    inputs.zen-browser.packages."${system}".twilight
  ];
  programs.firefox = {
    enable = true;
    # TODO more
  };
  # home.file.".config/Vieb/viebrc" = [
  #   text = ...
  # ];
}
