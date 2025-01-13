{
  imports = [
    #./wm/wm-bundle.nix
    #./dooit.nix #TODO get working with current setup
    ./packages/bundle-packages.nix
    ./nightlight.nix
    ./direnv.nix
    ./gen/gendle.nix
  ];
}
