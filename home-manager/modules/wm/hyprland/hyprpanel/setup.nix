{...}: {
  wayland.windowManager.hyprland.settings = {
    # Allows windows key to be used
    "$mod" = "SUPER";

    exec-once = [
      "hyprpanel"
    ];

    bind = [
      # Waybar open/close
      "$mod, B, exec, pkill -SIGUSR1 hyprpanel"
    ];
  };
}
