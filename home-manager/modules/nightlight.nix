{...}: {
  # gammastep changes temps and brightness automatically

  services.gammastep = {
    enable = true;

    # Changes temps at day/night
    temperature = {
      day = 5700;
      night = 3300;
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
        day = 5700;
        night = 3300;
      };

      brightness = {
        day = "1";
        night = "0.5";
      };

      gamma = {
        day = "0.8";
        night = "0.7:0.7:0.5";
      };

      general = {
        adjustment-method = "wayland";
      };
    };
  };
}
