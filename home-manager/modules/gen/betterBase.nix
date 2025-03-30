{...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza";
      cat = "bat";
    };
  };
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
      # "--no-cmd"
    ];
  };
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.bat = {
    enable = true;
  };
}
