{ self, pkgs, config, ... }:
{
  #programs.neovim = {
  #  enable = true;
  #  viAlias = true;
  #  vimAlias = true;
  #  vimdiffAlias = true;
  #};

  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
    };

    globals.mapleader = " ";

    #colorschemes.catppuccin-mocha.enable = true;

    # Manages plugins
    plugins = {
      ## Enables web dev icons
      web-devicons.enable = true;

      ## Manages telescope plugin
      telescope = {
        enable = true;
        extensions.file-browser = {
	  enable = true;
	  settings = {
	    mappings.n = {
	      "c" = "require('telescope._extensions.file_browser.actions').create";
	      "r" = "require('telescope._extensions.file_browser.actions').rename";
	"m" = "require('telescope._extensions.file_browser.actions').move";
	"y" = "require('telescope._extensions.file_browser.actions').copy";
	  "d" = "require('telescope._extensions.file_browser.actions').remove";
	  "o" = "require('telescope._extensions.file_browser.actions').open";
	  "g" = "require('telescope._extensions.file_browser.actions').goto_parent_dir";
	  "e" = "require('telescope._extensions.file_browser.actions').goto_home_dir";
	  "w" = "require('telescope._extensions.file_browser.actions').goto_cwd";
	  "t" = "require('telescope._extensions.file_browser.actions').change_cwd";
	  "f" = "require('telescope._extensions.file_browser.actions').toggle_browser";
	  "h" = "require('telescope._extensions.file_browser.actions').toggle_hidden";
	  "s" = "require('telescope._extensions.file_browser.actions').toggle_all";
	   };
	  };
	};
      };
	

      ## Enables nvimtree / nvims file explorer
      # nvimtree.enable = true;

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
      treesitter = {
      	enable = true;
	settings = {
	  ensure_installed = [
	    "nix"
	    "bash"
	    "python"
	  ];
	};
     };


    };
  };
}
