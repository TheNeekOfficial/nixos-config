{ self, pkgs, config, ... }:
{
  #programs.neovim = {
  #  enable = true;
  #  viAlias = true;
  #  vimAlias = true;
  #  vimdiffAlias = true;
  #};
  
  config = {
    programs.nixvim.enable = true;
    programs.nixvim = {
      options = {
        number = true;
        relativenumber = true;
        #incsearc = true;
      };

      globals.mapleader = " ";

      #colorschemes.catppuccin.enable = true;

      # Manages plugins
      plugins = {

        ## Manages telescope plugin
        telescope = {
          enable = true;
          extensions.file-browser.enable = true;
        };

        ## Enables nvimtree / nvims file explorer
        nvimtree.enable = true;

        ## Enables vim surround whic lets you put ( automatically )
        vim-surround.enable = true;

        ## Makes LSP Server config be managed seperately
        # nvim-lspconfig.enable = true; # Doesn't work
        ## TODO Add LSP servers needed

        ## enables fuzzy search
        fzf-lua.enable = true;

        ## Enables dashboard aka choose your starting location
        #dashboard = { # TODO Add settings for dashboard first - Check nixvim docs
        #  enable = true;
        #};

        ## TODO Enables status line
        ## apparently feline-nvim doesnt exist in nixvim outta box?

        ## Enables treesitter to make tabbing easier
        treesitter.enable = true;

      };
    };
  };

    ## OLD STUFF KEPT TO KEEP IDEA
  #plugins = with pkgs.vimPlugins; [
  #        #  
  #        #  telescope-nvim
  #        #  plenary-nvim
  #        #  #{
  #        #  #  plugin = telescope-nvim;
  #        #  #  config = toLua "require('config.telescope').setup()"; 
  #        #  #}

  #        #  telescope-fzf-native-nvim

  #        #  nvim-cmp
  #        #  cmp-nvim-lsp
  #        #  cmp-buffer
  #        #  cmp-nvim-lua
  #        #  lspkind-nvim
  #        #  cmp-path
  #        #  #{
  #        #  #  plugin = nvim-cmp;
  #        #  #  config = toLua "require('config.cmp').setup()";
  #        #  #}
  #        #  nvim-lspconfig

  #          (nvim-treesitter.withPlugins (p: [
  #              p.tree-sitter-nix
  #              p.tree-sitter-vim
  #              p.tree-sitter-bash
  #              p.tree-sitter-python
  #          ]))

  #          vim-nix
  #       ];
  #      };
}
