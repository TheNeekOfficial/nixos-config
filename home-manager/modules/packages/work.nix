{pkgs, ...}: {
  home.packages = with pkgs; [
    zoom-us
    feh # png viewer
    gimp
    krita
    vlc
    gifsicle
    notion-app
    # notion-app-enhanced
  ];
}
