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
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    alejandra,
    sops-nix,
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
        sops-nix.nixosModules.sops
        ({...}: {
          sops.defaultSopsFile = ./secrets/secrets.yaml;
          sops.defaultSopsFormat = "yaml";
          sops.age.keyFile = "/home/viktor/.config/sops/age/keys.txt";
        })

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hmbackup";
          home-manager.users.viktor = import ./home;
        }
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
