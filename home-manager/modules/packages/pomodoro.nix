{pkgs, ...}: {
  home.packages = with pkgs; [
    pomodoro-gtk
    pom
  ];
}
