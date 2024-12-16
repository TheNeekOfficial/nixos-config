# Sets a swapfile for the device if not done when installed
{
  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];
}
