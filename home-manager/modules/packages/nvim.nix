{
  pkgs,
  inputs,
  ...
}: let
  my-nvim = "${inputs.dotfiles}/.config/nvim";
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

      # NOTE: LSP's

      # Nix
      nixd

      # Python
      python312Packages.python-lsp-server

      # Ruby
      ruby-lsp

      # Lua
      lua-language-server # NOTE: Couldn't get working w/ lspconfig

      # NOTE: Formatters

      # Nix
      alejandra

      # Lua
      stylua

      # JS/TS
      javascript-typescript-langserver
      typescript-language-server
      vscode-langservers-extracted
    ];
  };

  home.file.".config/nvim" = {
    recursive = true;
    source = my-nvim;
    force = true;
  };

  programs.bash.shellAliases = {dotfiles = "nix flake update dotfiles";};
}
