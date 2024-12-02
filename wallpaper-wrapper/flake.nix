{
  description = "Wrapper for wallpaper Repo";

  inputs = {
    wallpapersRepo.url = "github:TheNeekOfficial/wallpapers";
    flake = false;
  };

  outputs = { self, wallpapersRepo, ... }:
  {
    defaultPackage.x86_64-linux = self;

    # Expose the wallpapers repo path
    wallpapers = {
      path = wallpapersRepo;
    };
  };
}
