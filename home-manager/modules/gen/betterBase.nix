{...}: {
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      # "--cmd cd"
      # "--no-cmd"
    ];
  };
}
