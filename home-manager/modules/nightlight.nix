{ self, pkgs, ... }:
{
  # Enables redshift to read my location here for accurate timings
  #services.geoclue2.enable = true;

  # Redshift changes temps and brightness automatically
  #environment.systemPackages = with pkgs; [
  #  gammastep
  #];

  services.gammastep = {
    enable = true;

    # Changes temps at day/night
    temperature = {
      day = 5700;
      night = 3300;
    };

    # Gives redshift my location for accurate times
    #provider = "geoclue2";

    # Other way to give redshift location
    latitude = "-33.8344"; 
    longitude = "151.1826";

    # Sets the times to changes things over
    dawnTime = "6:00-7:15";
    duskTime = "18:00-19:30";

    settings = {

      # Changes temps at day/night
      temperature = {
        day = 5700;
        night = 3300;
      };

      brightness = {
        day = "1";
        night = "0.7";
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
