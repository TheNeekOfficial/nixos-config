{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.services.wm.hyprland.extras;
  mkBrowserOption = def: desc:
    mkOption {
      type = types.str;
      default = "${def}";
      description = "${desc}";
    };
  mkWorkspaceOption = def: desc:
    mkOption {
      type = types.int;
      default = def;
      defaultText = "${def}";
      description = "Workspace you want your ${desc} browsers to open in";
    };
  mkBindOption = def:
    mkOption {
      type = types.str;
      default = "${def}";
      description = "What keybind do you want to use?";
    };
in {
  imports = [./hyprland.nix];
  options.services.wm.hyprland.extras = {
    enableGammaBright = mkEnableOption "Turn on night shift mode?";
    enableHyprBinds = mkEnableOption "Enable the ability to see your hyprland keybinds anywhere?";
    browser = mkOption {
      type = types.submodule {
        main = mkBrowserOption "zen" "The Main Browser you want to use";
        main2 = mkBrowserOption "firefox" "The Second Browser you mainly want to use";
        mainWorkSpace = mkWorkspaceOption 2 "main";
        spare = mkBrowserOption "vieb" "The spare browser you want to use";
        spare2 = mkBrowserOption "qutebrowser" "The Second Spare Browser you want to use";
        spareWorkspace = mkWorkspaceOption 4 "spare";
      };
    };
    screenshot = mkOption {
      type = types.submodule {
        enable = mkEnableOption "Enable screenshot ability?";
        keybind = mkBindOption "CTRL, F12";
      };
    };
  };
}
