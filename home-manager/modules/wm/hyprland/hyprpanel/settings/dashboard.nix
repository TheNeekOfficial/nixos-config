{...}: {
  programs.hyprpanel.settings = {
    dashboard = {
      directories.enabled = false;
      stats.enable_gpu = false;
    };
  };
}
