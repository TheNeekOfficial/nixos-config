{ self, pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    newSession = true;
		clock24 = true;
		keyMode = "vi";
		# Remaps prefix from 'C-b' to 'C-a'
		prefix = "C-a";

    # adds specific tmux plugins
    # NOTE: if using set -ag make sure the -g for the same option is above it
    plugins = with pkgs.tmuxPlugins; [
      # NOTE: set theme at first

      # {
      #   plugin = catppuccin; 
      #   extraConfig = ''
      #     set -g @catppuccin_flavor "mocha"
      #     set -g @catppuccin_window_status_style "rounded"
      #     # set -g @catppuccin_pane_right_separator "|"
      #
      #     set -g status-right-length 100
      #     set -g status-left-length 100
      #     set -g status-left ""
      #
      #     # Sets statuses to catppuccin specific ones
      #     # set -g status-right "#{E:@catppuccin_status_application}"
      #     # set -agF status-right "#{E:@catppuccin_status_cpu}"
      #     # set -ag status-right "#{E:@catppuccin_status_session}"
      #     # set -ag status-right "#{E:@catppuccin_status_uptime}"
      #     # set -agF status-right "#{E:@catppuccin_status_battery}"
      #     '';
      # }

      # NOTE: For Catppuccin | Couldnt get to work
      # {
      #   plugin = cpu;
      #   extraConfig = ''
      #     set -agF status-right "#{E:@catppuccin_status_cpu}"
      #     set -ag status-right "#{E:@catppuccin_status_session}"
      #     set -ag status-right "#{E:@catppuccin_status_uptime}"
      #     '';
      # }

      # NOTE: For Catppuccin theme | Couldnt get to work

      # {
      #   plugin = battery;
      #   extraConfig = ''
      #     set -agF status-right "#{E:@catppuccin_status_battery}"
      #     '';
      # }

      # NOTE: Tokyo Night Theme | Not done cba rn
      # {
      #   plugin = tokyo-night-tmux; 
      #   extraConfig = ''
      #     set -g @tokyo_night_tmux_theme night
      #     set -g @tokyo_night_tmux_transparent 1
      #     '';
      # }

      {
        plugin = vim-tmux-navigator;
      }

      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
          '';
      }

      {
        plugin = sysstat;
        extraConfig = ''
          set -g status-right " | #{sysstat_cpu} | #{sysstat_mem} | #{sysstat_swap}"
          # set -aog status-left "#{sysstat_cpu} | #{sysstat_mem} | #{sysstat_swap} |"
          '';
      }

      {
        # NOTE: For default status line

        plugin = battery;
        extraConfig = ''
          set -ag status-right ' | #{battery_status_bg} Batt: #{battery_icon} #{battery_percentage} #{battery_remain}'
          set -g status-right-length '150'
          '';
      }

    ];

    # Sets other config options necessary
    extraConfig = ''
			# change windows w/ alt-vim keys
			# bind -n 

			# switch panes w/ alt-vim keys
			# only works on panes not windows
			bind -n M-H select-pane -L
			bind -n M-K select-pane -U
			bind -n M-J select-pane -D
			bind -n M-L select-pane -R

			# Sets mouse to scroll term
			setw -g mouse on
			
			# Adds current time to status bar
			set -ag status-right ' | %a %h-%d %H:%M'

			# Resets everything if nothing has been set
			# set -og status-left ""
			# set -og status-right ""
			# set -og window-status-format "#I:#W#F"
			# set -og window-status-current-format "#I:#W#F"
			# set -og window-status-separator "|"
			  '';
  };
}
