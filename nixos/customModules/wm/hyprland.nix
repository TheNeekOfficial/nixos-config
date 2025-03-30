{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.wm.hyprland;
  mkDefTrueEnableOption = desc:
    mkOption {
      type = types.bool;
      default = true;
      defaulText = "true";
      description = "${desc}";
    };
in {
  options = {
    services.wm.hyprland = mkOption {
      type = types.submodule {
        enable = mkDefTrueEnableOption "Enable Hyprland?";
        xwayland = mkDefTrueEnableOption "Enable xwayland?";
        withUWSM = mkDefTrueEnableOption "Enable UWSM?";
        hyprlock = mkOption {
          type = types.submodule {
            enable = mkDefTrueEnableOption "Enable hyprlock?";
            suspendThenHibernate = mkOption {
              type = types.submodule {
                enable = mkEnableOption "Enable suspend then hibernate?";
                delayBtwn = mkOption {
                  type = types.int;
                  default = 120;
                  defaultText = "120m";
                  description = "Delay between suspend and hibernate in minutes";
                };
                isLaptop = mkEnableOption "Is device a laptop?";
              };
            };
          };
        };
        gnomeKeyring = mkDefTrueEnableOption "Enable gnome-keyring?";
        gammaStepLocation = mkDefTrueEnableOption "Enable Gammasteps location provider?";
        hyprpanel = mkOption {
          type = types.submodule {
            enable = mkDefTrueEnableOption "Enable hyprpanel?";
            batteryTrackerEnable = mkEnableOption "Enable battery tracker?";
            powerProfilesEnable = mkEnableOption "Enable power profiles?";
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    # NOTE: Hyprland Base stuff
    programs.hyprland = {
      enable = cfg.enable;
      withUWSM = cfg.withUWSM;
      xwayland = cfg.xwayland;
    };

    # NOTE: Hyprlock
    security.pam.services =
      (mkIf cfg.hyprlock.enable {
        hyprlock = {};
      })
      ++ (mkIf cfg.gnomeKeyring {
        hyprland.enableGnomeKeyring = cfg.gnomeKeyring;
      });
    systemd = mkIf cfg.hyprlock.enable {
      sleep = mkIf cfg.suspendThenHibernate.enable {
        extraConfig = ''
          HibernateDelaySec = ${cfg.suspendThenHibernate.delayBtwn}min
        '';
      };
    };
    services.logind.lidSwitch = mkIf cfg.hyprlock.enable and cfg.suspendThenHibernate.enable and cfg.suspendThenHibernate.isLaptop "suspend-then-hibernate";

    # NOTE: Additional Plugins
    services.geoclue2 = mkIf cfg.gammaStepLocation {enable = cfg.gammaStepLocation;};
    services.gnome.gnomekeyring = mkIf cfg.gnomeKeyring {enable = cfg.gnomeKeyring;};
    # NOTE: Enabling gnome keyring for hyprland done above under Hyprlock

    # NOTE: Hyprpanel stuff
    nixpkgs.overlays = mkIf cfg.hyprpanel.enable [inputs.hyprpanel.overlay];
    environment.systemPackages = mkIf cfg.hyprpanel.enable [pkgs.hyprpanel];
    services.upower = mkIf cfg.hyprpanel.enable {enable = cfg.hyprpanel.batteryTrackerEnable;};
    serices = mkIf cfg.hyprpanel.enable (mkIf cfg.hyprpanel.powerProfilesEnable {
      tlp = mkForce {enable = false;};
      power-profiles-daemon.enable = cfg.hyprpanel.powerProfilesEnable;
    });
  };
}
