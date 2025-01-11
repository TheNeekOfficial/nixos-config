{ self, pkgs, ... }:
let
  lock-time = 150; # 2.5min
  shutdown-time = 600; # 10min
in
{
  home.packages = with pkgs; [
    hypridle
    hyprlock

    # Enables loginctl
    elogind

    # NOTE: Already installed in hyprland.nix but still 
    # Enables brightnessctl
    brightnessctl
  ];

  services.hypridle = {
    enable = true;
    settings = {

      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        ignore_dbus_inhibit = false;
        before_sleep_cmd = "loginctl lock-session";
      };

      # NOTE: All whilst being idle
      # All times defined above
      listener = [

        # Dims monitor on timeout-seconds
        {
          timeout = 60;
          on-timeout = "brightnessctl -s set 5";
          on-resume = "brightnessctl -r";
        }

        # Lock screen on lock-time seconds
        {
          timeout = lock-time;
          on-timeout = "loginctl lock-session";
        }

        # Screen off after lock-time + 30 seconds
        {
          timeout = lock-time + 30;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dmps on";
        }

        # Suspend and hibernate after shutdown-time seconds
        {
          timeout = shutdown-time;
          on-timeout = "systemctl suspend-then-hibernate";
        }
      ];
    };
  };
}
