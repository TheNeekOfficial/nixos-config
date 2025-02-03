{...}: {
  programs.hyprpanel.settings = {
    menus = {
      clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };
    };
  };
}
