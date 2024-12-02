{
  description = "Wrapper for wallpaper Repo";

  inputs = {
    wallpapersRepo.url = "github:TheNeekOfficial/wallpapers";
  };

  outputs = { self, wallpapersRepo, ... }:
  {
    # Expose the wallpapers repo path
    wallpapers = {
      path = wallpapersRepo.outPath;
    };
  };
}
