{...}: {
  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true; # NOTE: Adds to exec-once for hyprland config
    # theme = "catppuccin-mocha"; # NOTE: Not working RN
    overwrite.enable = true;

    # NOTE: Layout
    layout = {
      "bar.layouts" = {
        "0" = {
          left = ["dashboard" "hypridle" "storage" "workspaces" "windowtitle"];
          middle = ["network" "media" "clock" "cpu"];
          right = ["ram" "bluetooth" "battery" "volume" "notifications" "power" "systray"];
        };
      };
    };

    settings = {
      # NOTE: Bar
      bar = {
        launcher.autoDetectIcon = true;
        workspaces = {
          # NOTE: Either numbered or icons not both
          show_numbered = true;
          show_icons = false;
          spacing = 0.2;
        };
        battery = {
          label = true;
          hideLabelWhenFull = false;
        };
        clock = {
          # format = "%a %b %d  %H:%M:%S";
          # format = "%H:%M:%S";
          format = "%x  %H:%M";
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
          truncation_size = 10;
        };
        network = {
          label = true;
          truncation = true;
          truncation_size = 0;
          showWifiInfo = false;
        };
        windowtitle = {
          class_name = false;
          custom_title = true;
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
          hypridle = {
            label = true;
          };
          cpuTemp = {
            unit = "metric";
            label = true;
            sensor = ""; # TODO: Need to set sensor up
          };
          power = {
            showLabel = true;
          };
          netstat = {
            label = true;
            # labelType = "half"; # NOTE: Not sure how to change from full
          };
          storage = {
            label = true;
            labelType = "percentage";
            icon = "󰋊";
            round = true;
          };
        };
      };

      # NOTE: Menus
      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };
          weather.unit = "metric";
        };
        dashboard = {
          directories.enabled = false;
          stats.enable_gpu = false;
          shortcuts = {
            enabled = true;
            left = {
              shortcut1 = {
                command = "firefox";
                icon = "";
                tooltip = "FireFox";
              };
              shortcut2 = {
                command = "kitty --title spotify_player spotify_player"; # TUI spotify --title spotify_player
                tooltip = "Spotify TUI";
                icon = "";
              };
              shortcut3 = {
                command = "vesktop";
                tooltip = "Discord";
                icon = "";
              };
              shortcut4 = {
                command = "wofi -show drun";
                icon = "";
                tooltip = "Search Apps";
              };
            };
          };
        };
      };

      # NOTE: Themes
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
          buttons = {
            padding_y = "0.05rem";
            workspaces = {
              numbered_active_highlight_border = "0.05em";
              numbered_active_highlight_padding = "0.05em";
              pill = {
                width = "0.1em";
                active_width = "6em";
                radius = "1.5rem * 0.3";
              };
            };
          };
        };
        font = {
          name = "CaskaydiaCove NF";
          size = "12px";
        };
      };
    };
  };

  imports = [
    ./setup.nix
  ];
}
