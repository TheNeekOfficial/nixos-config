# Sets a swapfile for the device if not done when installed
{
	boot.initrd.systemd.enable = true;
  swapDevices = [{
    device = "/swapfile";
    size = 20 * 1024; # 20GB
  }];
}
