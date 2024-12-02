
{
 description = "A basic NixOS flake";

 inputs = {
    # NixOS official package source, using the nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # NixOS Official source, setting stable version 24.11 as backup for package rollback
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Home Manager used for managing User configs
    home-manager = {
    	url = "github:nix-community/home-manager/master";
	
	# Follows keyword is used for inheritance
	# Inputs.pkgs is kept consistent to version of home manager
	# to avoid problem caused by different version of nixpkgs
	inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # Wallpapers git setup
    wallpapers-wrapper = {
      url = "path:./wallpaper-wrapper";
    };

    # ToDo list terminal
    # TODO get working
    #dooit.url = "github:dooit-org/dooit";
    #dooit-extras.url = "github:dooit-org/dooit-extras";
  };

 outputs = inputs@{ 
    self, 
    nixpkgs, 
    home-manager, 
    nixpkgs-stable, 
    hyprland,
    wallpapers-wrapper,
    ... 
  }: {
    # TODO get working based off flake install on wiki
    homeConfigurations."dylan@old-lapnix" = home-manager.lib.homeManagerConfiguration {
      modules = [
        {
          wayland.windowManager.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${nixpkgs.legacyPackages.x86_64-linux.stdenv.hostPlatform.system}.hyprland;
         };
        }
      ];
    };
   
    nixosConfigurations = {
    vm-3d = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = { 
        inherit inputs; 
	# To use packages from nixpkgs-stable,
        # we configure some parameters for it first
        pkgs-stable = import nixpkgs-stable {
          # Refer to the `system` parameter from
          # the outer scope recursively
          inherit system;
          # To use Chrome, we need to allow the
          # installation of non-free software.
          config.allowUnfree = true;
          };	
      };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./hosts/vm-3d-accel/nixos/configuration.nix

	# Make HM as module of nixos so deployments automatic
        home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

          home-manager.users.dylan = {
            imports = [
              ./home-manager/home.nix 
              ./home-manager/modules/wm/i3/bund-i3.nix
            ];
          };

	#  # Optionally use home-manager.extraSpecialArgs to pass arguments to home.nix
	}
       ];
     };
  old-lapnix = nixpkgs.lib.nixosSystem rec {
	system = "x86_64-linux";
	specialArgs = {
	  inherit inputs;
	  pkgs-stable = import nixpkgs-stable {
	    inherit system;
	    config.allowUnfree = true;
	  };
	};
	modules = [

          # Imports old config
          ./hosts/old-asus/nixos/configuration.nix
          ./nixos/modules/kdeconnectfirewall.nix

          # Imports home-manager
          home-manager.nixosModules.home-manager
	    {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs;};
              home-manager.users.dylan = {
                imports = [
                  ./home-manager/home.nix
                  ./home-manager/modules/wm/hyprland/bunland.nix

                  # Sources wallpapers to ~/.wallpapers
                  {
                    home.file.".wallpapers".source = wallpapers-wrapper.wallpapers.path;
                  }
                ];
              };
	    }
	];
     };	
   
   
   #let
   #  pkgs = import nixpkgs {};
   #  system = "x86_64-linux";
   #in {
   #  homeConfigurations."${username}" = nixpkgs.lib.nixosSystem {
   #    pkgs = pkgs;
   #    extraSpecialArgs = {
   #      inherit system inputs;
   #    };

   #    modules = [
   #      ./home-manager/modules/dooit.nix
   #    ];
   # };
 };
};
}
