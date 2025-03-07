{...}: {
  programs.hyprlock = {
    settings = {
      general = {
        disable_loading_bar = true;
        # grace = 30; # Sets 30s timer to where cna get back in w/o password NOTE: Means also applies after turned back on w/ hypridle
        no_fade_in = false;
      };

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          # outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "\'<span foreground=\"##cad3f5\">Password...</span>\'";
          shadow_passes = 2;
        }
      ];

      ## NOTE: NOT HOW
      ## TODO: fingerprint scan once setup

      # fingerprint = {
      #   enabled = true;
      #   ready_message = "example";
      #   present_message = "Your finger is placed";
      # };
    };
  };
}
