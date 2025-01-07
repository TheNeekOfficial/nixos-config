{ self, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # NOTE: Check recent things when doing this again

      mesa

      # your Open GL, Vulkan and VAAPI drivers
      vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
      # onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
      # intel-media-sdk   # for older GPUs
    ];
  };
}
