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

    # Wallpapers git setup
    wallpapers.url = "github:TheNeekOfficial/wallpapers";

    # dotfiles git setup
    dotfiles.url = "github:TheNeekOfficial/dotfiles";

    # Stylix for easy app customisation
    stylix.url = "github:danth/stylix";

    # Another way to rice Nix easily
    # nix-rice = { url = "github:bertof/nix-rice"; };
    # TODO: use to create an overlay for it to then apply to other programs
    # Find seperate one thats more updated

    # For easily seeing hyprland keybinds
    hypr-binds-flake = {
      url = "github:gvolpe/hypr-binds";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprpanel
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Supposedly better nix lang
    # lix-module = {
    #   url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # nix-snapd = {
    #   url = "github:nix-community/nix-snapd";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-stable,
    wallpapers,
    ...
  }: {
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

          # Imports all modules as base
          ./nixos/modules/bundle.nix

          # Make HM as module of nixos so deployments automatic
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.dylan = {
              imports = [
                ./home-manager/home.nix
                ./home-manager/modules/bundle.nix
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

          # Imports nixos modules ie. kdeconnect firewall override
          ./nixos/modules/bundle.nix

          # Adds swap file after install
          ./nixos/modules/swapfile.nix

          # Imports stylix
          inputs.stylix.nixosModules.stylix

          # Imports Hyprland
          ./nixos/modules/hyprland/bunland.nix

          # Imports home-manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs wallpapers;};
            home-manager.backupFileExtension = "backup";
            home-manager.users.dylan = {
              imports = [
                ./home-manager/home.nix
                ./home-manager/modules/bundle.nix
                ./home-manager/modules/wm/hyprland/bunland.nix
              ];
            };
          }
        ];
      };

      new-lapnix = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs system;
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          # Imports old config
          ./hosts/new-acer/configuration.nix

          # Imports nixos modules ie. kdeconnect firewall override
          ./nixos/modules/bundle.nix

          # Imports hyprland
          ./nixos/modules/hyprland/bunland.nix

          # Imports battery optimisations
          ./nixos/modules/battery/batt-bundle.nix

          # Imports copilot key rebind
          ./nixos/modules/kanata.nix

          # Import swappiness control to limit how much my system swaps
          ./nixos/modules/swappiness-control.nix

          # Different fork version of Nix language
          # inputs.lix-module.nixosModules.default

          # Imports home-manager
          # home-manager.nixosModules.home-manager
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.extraSpecialArgs = {inherit inputs system wallpapers;};
          #   home-manager.backupFileExtension = "hm-backup";
          #
          #   # NOTE: Disables vesktop as using Freesia's css
          #   # home-manager.sharedModules = [{ stylix.targets.vesktop.enable = false; }];
          #
          #   home-manager.users.dylan = {
          #     imports = [
          #       ./home-manager/home.nix
          #       ./home-manager/modules/bundle.nix
          #       ./home-manager/modules/wm/hyprland/bunland.nix
          #       ./home-manager/modules/gen/batt-signal.nix
          #     ];
          #   };
          # }
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

    # NOTE: Setting up seperate home-manager setup so dont need to use sudo to test new home files
    # TODO:
    homeConfigurations = let
      system = "x86_64-linux";
    in {
      "dylan" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
        extraSpecialArgs = {
          inherit inputs system wallpapers;
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./home-manager/home.nix
          ./home-manager/modules/bundle.nix
          ./home-manager/modules/wm/wm-bundle.nix
          # NOTE: Change for each host basis
          ./home-manager/modules/gen/batt-signal.nix
        ];
      };
    };
  };
}
