{ self, pkgs, ... }:
{
  security.pam.services.hyprlock = {};

  # NOTE: Makes Hibernate take 1 hour after using suspend-then-hibernate
  # Default = 2h
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=60min
    '';
   # NOTE: sets default closing lid action to suspend then hibernate
   services.logind.lidSwitch = "suspend-then-hibernate";
}
