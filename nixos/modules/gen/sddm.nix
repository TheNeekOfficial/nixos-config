{ self, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    catppuccin-sddm
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font = "JetBrains Mono";
      fontSize = "9";
      background = "${inputs.wallpapers.wallpapers.path}/nixos-wallpaper-catppuccin-mocha.png";
      loginBackground = true;
    })
    catppuccin-sddm-corners
  ];

  services.displayManager.sddm = { 
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    # theme = "catppuccin-sddm-corners";
    package = pkgs.kdePackages.sddm;
  };
}
