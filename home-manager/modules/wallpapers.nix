{ self, inputs, wallpapers-wrapper, ... }:
{
  home.file.".wallpapers".source = inputs.wallpapers-wrapper.wallpapers.path;
}
