{
  description = "My NixOS Flake";

inputs = {
  # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  nixpkgs.url = "github:xaverdh/nixpkgs/tuxedo-drivers";
  nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  tuxedo.url = "github:xaverdh/nixpkgs?ref=2c799a1db3bcc5b1c77cb127d219a1fe8fee864d";
};

  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }@inputs:
    let
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
        ];
      };
    };
}
