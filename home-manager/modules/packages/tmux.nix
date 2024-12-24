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
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
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
     '';
  };
}
