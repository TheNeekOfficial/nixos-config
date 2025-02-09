{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.hyprpanel;
in {
  options.programs.hyprpanel = {
    extraConfig = mkOption {
      default = "";
      example = ''
        [
          ["kitty", "󰄛", "Kitty Terminal"],
          ["firefox", "󰈹", "Firefox"],
          ["microsoft-edge.*", "󰇩", "Edge"],
          ["discord", "", "Discord"],
          ["org.kde.dolphin", "", "Dolphin"]
        ]
      '';
      type = types.lines;
      description = ''
        Extra settings added to end of config file
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.hyprpanel];
    xdg.configFile."hyprpanel/config.json" = mkIf (cfg.extraConfig != "") {
      text = ''
        ${cfg.extraConfig}
      '';
    };
  };
  imports = [./testExtra.nix];
}
