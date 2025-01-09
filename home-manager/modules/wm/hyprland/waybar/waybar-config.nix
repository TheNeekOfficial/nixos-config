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
        #height = 10;

        # Sets which monitors waybar appears on
        # output = [
        # "monitor-1"
        # ... etc
        # ];

        # Sets the modules shown on left of taskbar
        modules-left = [
          "hyprland/workspaces"
	        "custom/right-arrow-dark"
        ];

# Same but centre
        modules-center = [
          "custom/left-arrow-dark"
	        "clock#1"
          "custom/left-arrow-light"
	        "custom/left-arrow-dark"
	        "clock#2"
	        "custom/right-arrow-dark"
          "custom/right-arrow-light"
	        "clock#3"
          "custom/right-arrow-dark"
        ];

# Same but right
        modules-right = [
          "custom/left-arrow-dark"
          "pulseaudio"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "memory"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "cpu"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "battery"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "disk"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "tray"
        ];

        "custom/left-arrow-dark" = {
          format = "";
          tooltip = false;
	      };

        "custom/left-arrow-light" = {
          format = "";
          tooltip = false;
	      };

        "custom/right-arrow-dark" = {
          format = "";
          tooltip = false;
	      };
	      "custom/right-arrow-light" = {
          format = "";
          tooltip = false;
	      };

	      "hyprland/workspaces" = {
          disable-scroll = true;
          format = "{name}";
	      };

	      "clock#1" = {
          format = "{:%a}";
          tooltip = false;
	      };
	      "clock#2" = {
          format = "{:%H:%M}";
          tooltip = false;
	      };
	      "clock#3" = {
          format = "{:%d-%m}";
          tooltip = false;
	      };

	      "pulseaudio" = {
          format = "{icon}  {volume:2}%";
          format-bluetooth = "{icon}  {volume}%";
          format-muted = "MUTE";
          format-icons = {
            headphones = "";
            default = [
              ""
              ""
            ];
          };
          scroll-step = 5;
          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
	      };
	      "memory" = {
          interval = 5;
          format = "Mem {}%";
	      };
	      "cpu" = {
          interval = 5;
          format = "CPU {usage:2}%";
	      };
	      "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
	      };
	      "disk" = {
          interval = 5;
          format = "Disk {percentage_used:2}%";
          path = "/";
	      };
	      "tray" = {
          icon-size = 20;
	      };
      };
    };
  };
}
