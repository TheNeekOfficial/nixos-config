{
  inputs,
  system,
  ...
}: {
  # NOTE: Shows hyprland keybinds
  imports = [
    inputs.hypr-binds-flake.homeManagerModules."${system}".default
  ];
  programs.hypr-binds = {
    enable = true;
  };
}
