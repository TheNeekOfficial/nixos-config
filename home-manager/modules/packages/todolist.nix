{pkgs, ...}: {
  home.packages = with pkgs; [
    todoist
    todoist-electron
    planify
  ];
}
