{...}: {
  imports = [
    ./kdeconnectfirewall.nix
    ./gen/gendle.nix
    ./steam-game.nix
    # ./android/adb.nix
    ./android/waydroid.nix
    ./distrobox/distrobox.nix
  ];
}
