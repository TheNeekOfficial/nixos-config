{
  pkgs,
  dotfiles,
  ...
}: let
  my-nvim = "${dotfiles}/.config/nvim";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    extraPackages = with pkgs; [
      zig # Treesitter
      fzf
      fd
      lazygit
      ripgrep

      # LSP's
      nixd
      # rnix # NOTE: Not in nixpkgs

      # Formats
      alejandra
    ];
  };

  home.file.".config/nvim" = {
    recursive = true;
    source = my-nvim;
  };
}
