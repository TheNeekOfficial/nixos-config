{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.theming;
in {
  # TODO: Add different wallpapers ie. Hyprlock, Hyprpaper
  # NOTE: Leaving Hyprpaper for rn
  options.services.theming = {
    ## NOTE: Leaving for now as not sure how to handle HM module configuration
    # lockWallpaper = mkOption {
    #   type = types.str;
    #   default = "japan-fuji.jpg";
    #   defaultText = literalExpression "japan-fuji.jpg";
    #   description = "Which wallpaper wants to be used for the lockscreen";
    # };
    enable = mkEnableOption "Theming for setup";
    wallpaper = mkOption {
      type = types.str;
      default = "horimiya-hori-4k.png";
      defaultText = literalExpression "horimiya-hori-4k.png";
      description = "Which wallpaper to use";
    };
    stylix = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Use Stylix for theming";
          colorScheme = mkOption {
            type = types.str;
            default = "catppuccin-mocha"; # NOTE: Check how written in Stylix and other one available that I cant remember
            defaultText = literalExpression "catppuccin-mocha";
            description = "Which color scheme wants to be used";
          };
          polarity = mkOption {
            type = types.str;
            default = "dark";
            defaultText = literalExpression "dark";
            description = "Which polarity wants to be used";
          };
          disabledModules = mkOption {
            type = types.submodule {
              options = {
                kde.enable = mkEnableOption "Have stylix theme kde";
              };
            };
          };
        };
      };
    };
  };
  # TODO: Change from stylix
  config =
    mkMerge
    [
      (mkIf cfg.stylix.enable {
        # NOTE: Change from nixosModules for HM setup
        # imports = [inputs.stylix.${cfg.stylix.module}.stylix];
        stylix = let
          wallpaper = inputs.wallpapers.wallpapers.path;
          # disabledModules = builtins
        in {
          enable = cfg.stylix.enable;
          image = "${wallpaper}/${cfg.wallpaper}";
          polarity = cfg.stylix.polarity;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.stylix.colorScheme}.yaml";
          targets = {
            kde.enable = cfg.stylix.disabledModules.kde.enable;
          };
        };
      })
    ];
}
