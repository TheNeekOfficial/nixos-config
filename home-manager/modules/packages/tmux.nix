{ self, pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    newSession = true;

    # adds specific tmux plugins
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    # Sets other config options necessary
    extraConfig = ''
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      bind -n M-H previous-window
      bind -n M-L next-window
    '';
  };
}
