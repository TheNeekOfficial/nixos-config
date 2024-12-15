{ pkgs, self, ... }:
{
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;
      shellAliases = {
        direnv-setup = " echo 'use flake' >> .envrc && direnv allow";
      };
    };
  };
}
