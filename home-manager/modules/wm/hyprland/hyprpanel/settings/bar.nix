{...}: {
  programs.hyprpanel.settings = {
    bar = {
      launcher.autoDetectIcon = true;
      workspaces = {
        # NOTE: Either numbered or icons not both
        show_numbered = true;
        show_icons = false;
      };
      battery = {
        label = true;
        hideLabelWhenFull = false;
      };
      clock = {
        format = "%a %b %d  %H:%M:%S";
        showIcon = true;
        showTime = true;
      };
      bluetooth = {
        label = true;
      };
      media = {
        show_active_only = true;
        show_label = true;
        truncation = true;
        truncation_size = 15;
      };
      network = {
        label = true;
        truncation = true;
        truncation_size = 0;
        showWifiInfo = false;
      };
      windowtitle = {
        icon = true;
        label = true;
        truncation = true;
        truncation_size = 15;
      };
      customModules = {
        weather = {
          label = false;
          unit = "metric";
        };
      };
    };
  };
}
