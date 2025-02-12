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
          wallpaper = mkOption {
            type = types.str;
            default = wpDefault;
            defaultText = "Theming wallpaper";
            description = "Wallpaper for hyprlock, same rules as theming";
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
  };
  config = let
    wpPath = inputs.wallpapers.wallpapers.path;
  in
    mkIf cfg.enable {
      wayland.windowManager.hyprland.enable = cfg.enable;
      programs.hyprlock = mkIf cfg.hyprlock.enable {
        enable = cfg.hyprlock.enable;
        settings.background = [
          {
            path = "${wpPath}/${cfg.hyprlock.wallpaper}";
          }
        ];
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
    };
}
