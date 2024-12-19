{ self, nixvim, pkgs, ... }:
{
	programs.nixvim.telescope = {
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
		
