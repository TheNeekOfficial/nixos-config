{
 description = "A basic NixOS flake";

 inputs = {
    # NixOS official package source, using the nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # NixOS Official source, setting stable version 24.05 as backup for package rollback
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Home Manager used for managing User configs
    home-manager = {
    	url = "github:nix-community/home-manager/master";
	
	# Follows keyword is used for inheritance
	# Inputs.pkgs is kept consistent to version of home manager
	# to avoid problem caused by different version of nixpkgs
	inputs.nixpkgs.follows = "nixpkgs";
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
    ... 
 }: {
    nixosConfigurations = {
    lapnix = nixpkgs.lib.nixosSystem rec {
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
        ./nixos/configuration.nix

	# Make HM as module of nixos so deployments automatic
	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.dylan = import ./home-manager/home.nix;

	  # Optionally use home-manager.extraSpecialArgs to pass arguments to home.nix
	}
       ];
     };
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
}
