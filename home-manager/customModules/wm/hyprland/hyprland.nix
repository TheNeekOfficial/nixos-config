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
  # mkIfElse = p: yes: no:
  #   mkMerge [
  #     (mkIf p yes)
  #     (mkIf (!p) no)
  #   ];
in {
  imports = [../../gen/theming.nix];
  options.services.wm.hyprland = {
    enable = mkEnableOption "Enable Hyprland";
    hyprlock = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Enable Hyprlock";
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
          enable = mkEnableOption "Enable hyprpaper";
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
          enable = mkEnableOption "Enable hypridle";
          settings = mkOption {
            type = types.submodule {
              options = {
                general = mkOption {
                  type = types.submodule {
                    options = {
                      # hasPlayerCTL = mkEnableOption "Is playerctl installed?";
                      # hasLoginCTL = mkEnableOption "Is loginctl installed?";
                      ignore_dbus_inhibit = mkEnableOption "Ignore DBus inhibit?";
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
    #     enable = mkEnableOption "Enable waybar?";
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
          execOnce = mkEnableOption "Add to exec-once in hyprland";
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
        theme = mkIf (!themeCheck) cfg.hyprpanel.theme;
        override = mkIf (themeCheck && (cfg.hyprpanel.theme == "monokai")) {
          #   # NOTE: Example: theme.bar.menus.text = "#123ABC";
          # theme.bar.menus.text = "#d6d6d6";
          theme.bar.menus.text = "#ffd866";
          theme.bar.buttons.workspaces.numbered_active_highlighted_text_color = "#d6d6d6";
          # TODO: Override in menu colour options
        };
      };
    };
}
