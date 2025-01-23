{...}: let
  tmuxinator-config = ".config/tmuxinator";
in {
  # NOTE: Enables tmuxinator
  programs.tmux.tmuxinator.enable = true;

  # NOTE: Sets mux alias for tmuxinator
  programs.bash = {
    enable = true;
    shellAliases = {
      mux = "tmuxinator";
    };
  };

  home.file."${tmuxinator-config}/gen.yml" = {
    text = ''
      # /home/dylan/.config/tmuxinator/gen.yml

      name: gen
      root: ~/

      # Specifies (by name or index) which window will be selected on project startup. If not set, the first window is used.
      startup_window: editor

      windows:
        - editor:
            # Synchronize all panes of this window, can be enabled before or after the pane commands run.
            # 'before' represents legacy functionality and will be deprecated in a future release, in favour of 'after'
            # synchronize: after
            panes:
              - nvim
        - bash:
          panes:
            - bash
    '';
  };

  home.file."${tmuxinator-config}/nix.yml" = {
    text = ''
      # /home/dylan/.config/tmuxinator/nix.yml

      name: nix
      root: ~/nix/nixos-config/

      startup_window: editor

      windows:
        - editor:
            panes:
              - nvim
        - nh:
          panes:
            - bash
    '';
  };

  home.file."${tmuxinator-config}/dotfiles.yml" = {
    text = ''
      # /home/dylan/dotfiles/

      name: dotfiles
      root: ~/dotfiles/

      startup_window: editor

      windows:
        - editor:
            panes:
              - nvim
        - bash:
          panes:
            - bash
    '';
  };
  home.file."${tmuxinator-config}/coding.yml" = {
    text = ''
      # /home/dylan/coding/

      name: coding
      root: ~/coding

      startup_window: editor

      windows:
        - editor:
            panes:
              - nvim
        - bash:
          panes:
            - bash
    '';
  };

  home.file."${tmuxinator-config}/notes.yml" = {
    text = ''
      # /home/dylan/.config/tmuxinator/gen.yml

      name: notes
      root: ~/class-notes/

      # Specifies (by name or index) which window will be selected on project startup. If not set, the first window is used.
      startup_window: note-taker

      windows:
        - note-taker:
            # Synchronize all panes of this window, can be enabled before or after the pane commands run.
            # 'before' represents legacy functionality and will be deprecated in a future release, in favour of 'after'
            # synchronize: after
            panes:
              - nvim
    '';
  };
}
