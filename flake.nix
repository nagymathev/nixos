{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secure Boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    alejandra,
    lanzaboote,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations.stellaris = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        inherit pkgs;
        inherit lib;
      };
      modules = [
        ./systems/stellaris
        nixos-hardware.nixosModules.tuxedo-pulse-14-gen3

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hmbackup";
          home-manager.users.viktor = import ./home;
        }

        # SECURE BOOT SETUP

        #        lanzaboote.nixosModules.lanzaboote

        ({
          pkgs,
          lib,
          ...
        }: {
          environment.systemPackages = [
            # For debugging and troubleshooting Secure Boot.
            pkgs.sbctl
          ];

          # Lanzaboote currently replaces the systemd-boot module.
          # This setting is usually set to true in configuration.nix
          # generated at installation time. So we force it to false
          # for now.
          #          boot.loader.systemd-boot.enable = lib.mkForce false;
          #
          #          boot.lanzaboote = {
          #            enable = true;
          #            pkiBundle = "/var/lib/sbctl";
          #          };
        })
      ];
    };

    nixosConfigurations.icarus = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        inherit pkgs;
        inherit lib;
      };
      modules = [
        ./systems/icarus

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.viktor = import ./home;
        }
      ];
    };

    # The PC with the rgb PSU
    nixosConfigurations.equuleus = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        inherit pkgs;
        inherit lib;
      };

      modules = [
        ./systems/equuleus

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.viktor = import ./home;
        }
      ];
    };
    formatter.x86_64-linux = alejandra.defaultPackage.x86_64-linux;
  };
}
