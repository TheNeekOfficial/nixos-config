{pkgs, ...}: {
  home.packages = with pkgs; [
    #Network
    networkmanagerapplet
    blueman

    # Notifications
    dunst

    # Apps
    waybar
  ];

  # Sets up waybar w/ hyprland
  wayland.windowManager.hyprland.settings = {
    # Allows windows key to be used
    "$mod" = "SUPER";

    exec-once = [
      "nm-applet --indicator & disown"
      "blueman-applet"
      "dunst"
      "sleep 1 && waybar"
    ];

    bind = [
      # Waybar open/close
      "$mod, B, exec, pkill -SIGUSR1 waybar"
    ];
  };
}
