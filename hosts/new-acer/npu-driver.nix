{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-snapd.nixosModules.default
    {
      services.snap.enable = true;
    }
  ];
  hardware.firmware = with pkgs; [linux-firmware firmwareLinuxNonfree];
}
