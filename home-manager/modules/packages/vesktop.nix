{ config, pkgs, inputs, lib, ... }:
let
  # Freesia's discord css
  monokai-pro-css = pkgs.fetchFromGitHub {
    owner = "freesiagaul";
    repo = "monokai-pro-betterdiscord";
    rev = "5da5b385d1d6947f90ed86e9827e6a1b51292d28";
    sha256 = "vuPrwVc3zlwGy/PpdKyy/qp+ntv1qmCVhzKjs4FhiGE=";
  } + "/monokai_theme.css";
in
{
  home.packages = with pkgs; [ 
    vesktop
  ];

  imports = [ inputs.vesktop-nix.homeManagerModules.default ];
  
  programs.vesktop = {
    enable = true;
    
    themes = {
      monokai-pro = monokai-pro-css;
    };
  };
}

