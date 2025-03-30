{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.services.wm.hyprland;
  wpDefault = config.services.theming.wallpaper;
  hypridleSettingsGeneral = cfg.hypridle.settings.general;
  mkDefTrueEnableOption = desc:
    mkOption {
      type = types.bool;
      default = true;
      defaultText = "true";
      description = "${desc}";
    };
  # mkIfElse = p: yes: no:
  #   mkMerge [
  #     (mkIf p yes)
  #     (mkIf (!p) no)
  #   ];
in {
  imports = [../../gen/theming.nix];
  options.services.wm.hyprland = {
    enable = mkDefTrueEnableOption "Enable Hyprland";
    hyprlock = mkOption {
      type = types.submodule {
        options = {
          enable = mkDefTrueEnableOption "Enable Hyprlock";
          background = mkOption {
            type = types.submodule {
              options = {
                wallpaper = mkOption {
                  type = types.str;
                  default = wpDefault;
                  defaultText = "Theming wallpaper";
                  description = "Wallpaper for hyprlock, same rules as theming";
                };
                blurPasses = mkOption {
                  type = types.int;
                  default = 3;
                  defaultText = "3";
                  description = "how many passes do you want the blue to go through";
                };
                blurSize = mkOption {
                  type = types.int;
                  default = 8;
                  defaultText = "8";
                  description = "How big do you want each blur that passes be?";
                };
                force = mkOption {
                  type = types.bool;
                  default = false;
                  defaultText = "false";
                  description = "Force entries to go through?";
                };
              };
            };
          };
        };
      };
    };
    hyprpaper = mkOption {
      type = types.submodule {
        options = {
          enable = mkDefTrueEnableOption "Enable hyprpaper";
          wallpaper = mkOption {
            type = types.str;
            default = wpDefault;
            defaultText = "Theming wallpaper";
            description = "Wallpaper for hyprland, same rules as theming";
          };
        };
      };
    };
    hypridle = mkOption {
      type = types.submodule {
        options = {
          enable = mkDefTrueEnableOption "Enable hypridle";
          settings = mkOption {
            type = types.submodule {
              options = {
                general = mkOption {
                  type = types.submodule {
                    options = {
                      # hasPlayerCTL = mkDefTrueEnableOption "Is playerctl installed?";
                      # hasLoginCTL = mkDefTrueEnableOption "Is loginctl installed?";
                      ignore_dbus_inhibit = mkDefTrueEnableOption "Ignore DBus inhibit?";
                      lockCmd = mkOption {
                        type = types.str;
                        # NOTE: Somehow check if hyprlock's enabled too
                        default = "playerctl -a pause & pidof hyprlock || hyprlock";
                        defaultText = "if PlayerCTL installed, pauses music then locks screen, else just locks screen";
                        description = "Command to be run when locking screen";
                      };
                      # NOTE: Have a non-loginctl default
                      beforeSleepCmd = mkOption {
                        type = types.str;
                        default = "loginctl lock-session";
                        defaultText = "Locks screen before sleep if loginctl installed, else does nothing";
                        description = "Command to be run before sleep";
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };

    # TODO: setup waybar and hyprpanel options
    # Set theme to hyprpanel same as system
    # might need to change `-` to `_` w/ lib.replaceString or similar

    # waybar = mkOption {
    #   type = types.submodule {
    #     enable = mkDefTrueEnableOption "Enable waybar?";
    #   };
    # };

    # TODO: Setup custom theme options w/ override option in Hyprpanel HM module
    hyprpanel = mkOption {
      type = types.submodule {
        options = {
          enable = mkOption {
            type = types.bool;
            default = true;
            defaultText = "Sets Hyprpanel to true";
            description = "Enable Hyprland?";
          };
          theme = mkOption {
            type = types.str;
            default = replaceStrings ["-"] ["_"] (builtins.toString config.services.theming.colorScheme);
            defaultText = "Default theme";
            description = "Color Theme for hyprpanel";
          };
          execOnce = mkDefTrueEnableOption "Add to exec-once in hyprland";
          overwritePanelFile = mkOption {
            type = types.bool;
            default = true;
            defaultText = "true";
            description = "Overwrites hyprpanel file so dont need to do -b on home switch";
          };
        };
      };
    };
  };
  config = let
    wpPath = inputs.wallpapers.wallpapers.path;
    hyprlockSetup = [
      {
        path = "${wpPath}/${cfg.hyprlock.background.wallpaper}";
        blur_passes = cfg.hyprlock.background.blurPasses;
        blur_size = cfg.hyprlock.background.blurSize;
      }
    ];
    customThemes = ["monokai"];
    themeCheck = elem "${cfg.hyprpanel.theme}" customThemes;
  in
    mkIf cfg.enable {
      wayland.windowManager.hyprland.enable = cfg.enable;
      programs.hyprlock = mkIf cfg.hyprlock.enable {
        enable = cfg.hyprlock.enable;
        settings.background =
          if cfg.hyprlock.background.force
          then mkForce hyprlockSetup
          else mkDefault hyprlockSetup;
      };
      services.hyprpaper = mkIf cfg.hyprpaper.enable {
        enable = cfg.hyprpaper.enable;
        settings = {
          preload = ["${wpPath}/${cfg.hyprpaper.wallpaper}"];
          wallpaper = [", ${wpPath}/${cfg.hyprpaper.wallpaper}"];
        };
      };
      home.packages = with pkgs;
        mkIf cfg.hypridle.enable [
          playerctl
          elogind
        ];
      services.hypridle = mkIf cfg.hypridle.enable {
        enable = cfg.hypridle.enable;
        settings = {
          general = {
            lock_cmd = hypridleSettingsGeneral.lockCmd;
            ignore_dbus_inhibit = hypridleSettingsGeneral.ignore_dbus_inhibit;
            before_sleep_command = hypridleSettingsGeneral.beforeSleepCmd;
          };
        };
      };
      programs.hyprpanel = mkIf cfg.hyprpanel.enable {
        enable = cfg.hyprpanel.enable;
        hyprland.enable = cfg.hyprpanel.execOnce;
        overwrite.enable = cfg.hyprpanel.overwritePanelFile;

        # NOTE: To check if theme is not in a custom themes list
        # (mkIf !elem "${cfg.hyprpanel.theme}" ["custom" "themes" "here"])
        # NOTE: if cfg.hyprpanel.theme needed to be a list (for custom themes eg.)
        # lb.any (x: lb.elem x [ "y" "z" ]) [ "x" ]
        theme =
          if (!themeCheck)
          then cfg.hyprpanel.theme
          else "";
        override = mkIf (themeCheck && (cfg.hyprpanel.theme == "monokai")) {
          # NOTE: Colours
          # #78dce8 Light Blue
          # #d6d6d6 Off White
          # #ffd866 Golden
          # #b05279 Dark Magenta
          # #ff6188 Bright Magenta - Most liked so far
          # #eb1348 Bright Magenta
          # #f36d8e
          # #b50f37 Dark Red

          # theme.bar.menus.text = "#d6d6d6";
          theme.bar.menus.text = "#f36d8e";

          # NOTE: Doesnt do as expected
          # theme.bar.buttons.workspaces.numbered_active_highlighted_text_color = "#fcfcfa";

          # NOTE: Main colour is from Monokai Discord CSS
          theme.bar.buttons.workspaces.numbered_active_underline_color = "#78dce8";
          theme.bar.buttons.workspaces.hover = "#ff6188";
          theme.bar.buttons.workspaces.active = "#78dce8";
          theme.bar.buttons.workspaces.occupied = "#e5b567";
          theme.bar.buttons.workspaces.available = "#d6d6d6";
          # NOTE: Name of devices
          # theme.bar.menus.menu.volume.text = "#e5b567";
          # theme.bar.menus.menu.volume.label.color = "#e5b567";

          # NOTE: actual control menu
          # theme.bar.menus.menu.dashboard.controls.volume.text = "#e5b567";
          theme.bar.buttons.volume.text = "#e5b567";
          theme.bar.buttons.volume.icon = "#e5b567";
          # TODO: Override in menu colour options
        };
      };
    };
}
