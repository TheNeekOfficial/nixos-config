
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
