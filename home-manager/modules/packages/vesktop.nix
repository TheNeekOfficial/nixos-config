{ pkgs, lib, ... }:
let
  # Freesia's discord css
  monokai-pro-css = pkgs.fetchFromGitHub {
    owner = "freesiagaul";
    repo = "monokai-pro-betterdiscord";
    rev = "5da5b385d1d6947f90ed86e9827e6a1b51292d28"; # If updated update this too
    sha256 = "vuPrwVc3zlwGy/PpdKyy/qp+ntv1qmCVhzKjs4FhiGE="; # If updated get hash w/ lib.fakeSha256a;
  } + "/monokai_theme.css";
in
{
  home.packages = with pkgs; [ 
    vesktop
  ];

  home.file.".config/vesktop/themes/monokai-pro.css" = {
    source = monokai-pro-css;
  };
}

