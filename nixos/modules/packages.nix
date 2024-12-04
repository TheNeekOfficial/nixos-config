{pkgs, pkgs-stable, ...}:
{
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget    

    # Own Mods
    home-manager

    # Git/Development
    git
    pkgs-stable.gh
    devenv
  ];
}
