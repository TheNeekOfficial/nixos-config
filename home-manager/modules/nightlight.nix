{...}: let
  dayt = 5700;
  night-t = 2700;
in {
  # gammastep changes temps and brightness automatically

  services.gammastep = {
    enable = true;

    # Changes temps at day/night
    temperature = {
      day = dayt;
      night = night-t;
    };

    # Gives redshift my location for accurate times
    provider = "geoclue2";

    # Other way to give redshift location
    # latitude = "lat";
    # longitude = "long";

    # Sets the times to changes things over
    dawnTime = "6:00-7:15";
    duskTime = "20:00-22:00";

    settings = {
      # Changes temps at day/night
      temperature = {
        day = dayt;
        night = night-t;
      };

      brightness = {
        day = "1";
        night = "0.4";
      };

      gamma = {
        day = "0.8";
        night = "0.6:0.6:0.3"; # R/G/B
      };

      general = {
        adjustment-method = "wayland";
      };
    };
  };
}
