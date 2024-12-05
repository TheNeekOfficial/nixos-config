{self, config, ...}:

{
  programs.waybar = {

    enable = true;

    settings = {
      
      mainBar = {

        # Puts waybar on top of apps that are under it
        layer = "top";

        # Puts waybar at top of screen
        position = "top";

        # Sets height of waybar
        height = 10;

        # Sets which monitors waybar appears on
        # output = [
          # "monitor-1"
          # ... etc
        # ];
        
        # Sets the modules shown on left of taskbar
        modules-left = ["wlr/taskbar"];

        # Same but centre
        modules-center = ["hyprland/workspaces" "clock"];

        # Same but right
        modules-right = ["tray" "wireplumber" "battery" "cpu" "memory" "user"];

        # Sets settings for "user" module
        "user" = {

          # Sets format for what to display in waybar
          "format" = "{user} {work_H}:{work_M} ↑";

          # Sets refresh time of it in seconds
          "interval" = 60;

          # Sets height and width of display
          "height" = 15;
          "width" = 15;

          # Sets if want avater icon
          "icon" = false;
        };

        # Sets RAM disp settings
        "memory" = {
          
          # Sets format
          format = "{percentage}% RAM";

          # Sets refresh time
          interval = 15;
        };

        # Sets cpu disp settings
        "cpu" = {
          format = "{usage}% {icon} CPU";
          interval = 10;
          max-length = 10;
        };

        # Sets battery disp settings
        "battery" = {
          format = "{capacity}% 🔋";
        };

        # Sets WirePlumber disp settings
        "wireplumber" = {
          format = "{volume}% 🔈";
        };

      };
    };
  };
}
