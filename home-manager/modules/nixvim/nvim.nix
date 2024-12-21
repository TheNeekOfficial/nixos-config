{ self, pkgs, config, ... }:
{
  #programs.neovim = {
  #  enable = true;
  #  viAlias = true;
  #  vimAlias = true;
  #  vimdiffAlias = true;
  #};

	## added to help with telescope
	home.packages = with pkgs; [
		fd
		ripgrep
	];

  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
			tabstop = 2;
			shiftwidth = 2;
    };

    autoCmd = [{
        event = "FileType";
        pattern = "nix";
        command = "setlocal tabstop=2 shiftwidth=2";
      }];

    globals.mapleader = " ";

    #colorschemes.catppuccin-mocha.enable = true;

    # Manages plugins
    plugins = {
      ## Enables web dev icons
      web-devicons.enable = true;

      ## Manages telescope plugin
      telescope = {
        enable = true;
				keymaps = {
					#"<C-p>" = {
					#	action = "git_files";
					#	options = {
					#		desc = "Telescope Git Files";
					#	};
					#};
					"<leader>sh" = {
						action = "help_tags";
						options = {
							desc = "[S]earch [H]elp";
						};
					};
					"<leader>sk" = {
						action = "keymaps";
						options = {
							desc = "[S]earch [K]eymaps";
						};
					};
					"<leader>sf" = {
						action = "find_files";
						options = {
							desc = "[S]earch [F]iles";
						};
					};
					"<leader>ss" = {
						action = "builtin";
						options = {
							desc = "[S]earch [S]elect Telescope";
						};
					};
					"<leader>sw" = {
						action = "grep_string";
						options = {
							desc = "[S]earch current [W]ord";
						};
					};
					"<leader>sg" = {
						action = "live_grep";
						options = {
							desc = "[S]earch by [G]rep";
						};
					};
					"<leader>sd" = {
						action = "diagnostics";
						options = {
							desc = "[S]earch [D]iagnostics";
						};
					};
					"<leader>sr" = {
						action = "resume";
						options = {
							desc = "[S]earch [R]esume";
						};
					};
					"<leader>fb" = {
						action = "file_browser";
						options = {
							desc = "[F]ile [B]rowser Telescope";
						};
					};
					## refer to kickstart nvim for more can use
				};

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
							"p" = "require('telescope._extensions.file_browser.actions').goto_parent_dir";
							"h" = "require('telescope._extensions.file_browser.actions').goto_home_dir";
							"w" = "require('telescope._extensions.file_browser.actions').goto_cwd";
							"n" = "require('telescope._extensions.file_browser.actions').change_cwd";
							"<C-b>" = "require('telescope._extensions.file_browser.actions').toggle_browser";
							"<C-h>" = "require('telescope._extensions.file_browser.actions').toggle_hidden";
							"<C-a>" = "require('telescope._extensions.file_browser.actions').toggle_all";
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
					"csv"
				];
				indent.enable = true;
			};
		};
		refactoring = {
			enable = true;
			enableTelescope = true;
			settings = {
				show_success_message = true;
			};
		};
	};
 };
}
