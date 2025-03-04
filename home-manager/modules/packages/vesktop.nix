{pkgs, ...}: let
  # Freesia's discord css
  monokai-pro-css =
    pkgs.fetchFromGitHub {
      owner = "freesiagaul";
      repo = "monokai-pro-betterdiscord";
      rev = "fb4c83348e4578e8ee9e1334b5b335b11f62a7e6"; # If updated update this too
      sha256 = "JUpOCSxJaq4CHCnyAYhsBNsNiz3OxYCerhS7b78/3w4="; # If updated get hash w/ lib.fakeSha256a;
    }
    + "/monokai.theme.css";
in {
  home.packages = with pkgs; [
    vesktop
  ];

  home.file.".config/vesktop/themes/monokai-pro.css" = {
    source = monokai-pro-css;
  };
}
