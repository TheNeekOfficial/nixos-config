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
  options.services.theming = {
    enable = mkEnableOption "Theming for setup";
    wallpaper = mkOption {
      type = types.str;
      default = "horimiya-hori-4k.png";
      defaultText = literalExpression "horimiya-hori-4k.png";
      description = "Which wallpaper to use";
    };
    colorScheme = mkOption {
      type = types.str;
      default = "catppuccin-mocha"; # NOTE: Check how written in Stylix and other one available that I cant remember
      defaultText = literalExpression "catppuccin-mocha";
      description = "Which color scheme wants to be used";
    };
    stylix = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Use Stylix for theming";
          # TODO: Need to get working
          colorModules = mkOption {
            type = types.submodule {
              enable = mkEnableOption "Enable Color Modules to easily swap around between preset colorschemes?";
              catppucinMocha.enable = mkOption {
                type = types.bool;
                default = true;
                defaultText = literalExpression "Enables catppucin-mocha colorscheme by default";
                description = "Enable catppuccin-mocha colorscheme?";
              };
              rose-pine-moon.enable = mkEnableOption "Enable rose-pine-moon colorscheme?";
              mocha.enable = mkEnableOption "Enable mocha colorscheme?";
              uwunicorn.enable = mkEnableOption "Enable uwunicorn colorscheme?";
            };
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
                hyprlock.enable = mkEnableOption "Have stylix theme hyprlock";
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
        stylix = {
          enable = cfg.stylix.enable;
          image = "${inputs.wallpapers.wallpapers.path}/${cfg.wallpaper}";
          polarity = cfg.stylix.polarity;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.colorScheme}.yaml";
          targets = {
            kde.enable = cfg.stylix.disabledModules.kde.enable;
            hyprlock.enable = cfg.stylix.disabledModules.hyprlock.enable;
          };
        };
      })
      # (mkMerge
      #   [
      #     (mkIf cfg.stylix.colorModules.enable and cfg.stylix.enable and (cfg.stylix.colorScheme != "")
      #       {
      #         style.base16Schemes = "";
      #       })
      #   ];
      # )
    ];
}
