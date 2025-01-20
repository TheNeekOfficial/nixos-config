{pkgs, ...}: {
  home.packages = with pkgs; [
    _4d-minesweeper
    endgame-singularity
    vvvvvv
    nbsdgames
    nudoku
    freesweep # TUI Minesweeper
    libremines # GUI minesweeper
  ];
}
