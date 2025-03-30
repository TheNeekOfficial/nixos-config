{
  lib,
  config,
  ...
}:
with lib; let
  mainCfg = config.services.wm.hyprland;
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
  mkMusicOption = def:
    mkOption {
      type = types.str;
      default = "${def}";
      description = "The Music service option you want to use";
    };
  mkDefEnableOption = mkOption {
    type = types.bool;
    default = true;
    description = "This option is on by default";
  };
in {
  imports = [./hyprland.nix];
  # TODO: Change to wm.extras and configure based on which wm's are enabled
  options.services.wm.hyprland.extras = {
    enableGammaBright = mkEnableOption "Turn on night shift mode?";
    SeeHyprBinds = mkOption {
      type = types.submodule {
        options = {
          enable = mkDefEnableOption "Enable the ability to see your hyprland keybinds anywhere?";
          bind = mkBindOption "CTRL ALT, k";
        };
      };
    };
    browser = mkOption {
      type = types.submodule {
        options = {
          # inputs?name to check ig according to Gerg
          main = mkBrowserOption "zen" "The Main Browser you want to use";
          main2 = mkBrowserOption "firefox" "The Second Browser you mainly want to use";
          mainWorkSpace = mkWorkspaceOption 2 "main";
          mainBind = mkBindOption "$mod, W";
          main2Bind = mkBindOption "ALT ${cfg.browser.mainBind}";
          spare = mkBrowserOption "vieb" "The spare browser you want to use";
          spare2 = mkBrowserOption "qutebrowser" "The Second Spare Browser you want to use";
          spareWorkspace = mkWorkspaceOption 4 "spare";
          spareBind = mkBindOption "$mod, V";
          spare2Bind = mkBindOption "ALT ${cfg.browser.spareBind}";
        };
      };
    };
    screenshot = mkOption {
      type = types.submodule {
        options = {
          enable = mkDefEnableOption "Enable screenshot ability?";
          keybind = mkBindOption "CTRL, F12";
        };
      };
    };
    music = mkOption {
      type = types.submodule {
        options = {
          main = mkMusicOption "${config.services.wm.hyprland.terminal} ${getExe pkgs.spotify_player}";
          main2 = mkMusicOption "${getExe pkgs.spotify}";
          mainWorkspace = mkWorkspaceOption 2 "main";
          mainBind = mkBindOption "$mod, S";
          main2Bind = mkBindOption "ALT ${cfg.music.mainBind}";
        };
      };
    };
  };

  config = mkIf mainCfg.enable {
    wayland.windowManager.hyprland = {
      settings = {
        "$mod" = "SUPER";

        bind = [
          # Browsers
          "${cfg.browsers.mainBind}, exec, ${cfg.browsers.main}"
          "${cfg.browser.main2Bind}, exec, ${cfg.browser.main2}"
          "${cfg.browsers.spareBind}, exec, ${cfg.browsers.spare}"
          "${cfg.browsers.spare2Bind}, exec, ${cfg.browsers.spare2}"

          # Music
          "${cfg.music.mainBind}, exec, ${cfg.music.main}"
          "${cfg.music.main2Bind}, exec, ${cfg.music.main2}"
        ];

        windowrulev2 = [
          # Browsers
          "workspace ${cfg.browsers.mainWorkspace}, class:(.*)${cfg.browsers.main}(.*)"
          "workspaces ${cfg.browsers.mainWorkspace}, class:(.*)${cfg.browsers.main2}(.*)"
          "workspaces ${cfg.browsers.spareWorkspace}, class:(.*)${cfg.browsers.spare}(.*)"
          "workspaces ${cfg.browsers.spareWorkspace}, class:(.*)${cfg.browsers.spare2}(.*)"

          # Music
          "workspaces ${cfg.music.mainWorkspace}, class:(.*)${cfg.music.main}(.*)"
          "workspaces ${cfg.music.mainWorkspace}, class:(.*)${cfg.music.main2}(.*)"
        ];
      };
    };
  };
}
