# NOTE: Also can do in a dev shell by android-tools
{pkgs, ...}: {
  # Enables adb for users
  programs.adb.enable = true;
  users.users.dylan.extraGroups = ["kvm" "adbusers"];

  # Adds adb to udev (automatic usb/external storage reader)
  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}
