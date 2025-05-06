{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nh
    nix-output-monitor
    nvd
  ];

  environment.sessionVariables = {
    NH_FLAKE = "/home/dylan/nix/nixos-config";
  };
}
