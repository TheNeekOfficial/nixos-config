{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    #noto-fonts-color-emoji
    #noto-fonts-monochrome-emoji
    #noto-fonts
    #noto-fonts-cjk-serif
    #openmoji-color
  ];
}
