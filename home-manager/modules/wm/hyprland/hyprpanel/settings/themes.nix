{...}: {
  programs.hyprpanel.settings = {
    theme = {
      bar = {
        transparent = true;
        margin_bottom = "0em";
        margin_sides = "0.25em";
        margin_top = "0.25em";
        outer_spacing = "0.8em";
        menus = {
          border = {
            size = "0.06em";
            radius = "0.35em";
          };
        };
      };
      font = {
        name = "CaskaydiaCove NF";
        size = "12px";
      };
    };
  };
}
