{
description = "My NixOS Flake";

inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	nixos-hardware.url = "github:NixOS/nixos-hardware/master";
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	nixvim = {
		url = "github:nix-community/nixvim";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	stylix.url = "github:danth/stylix";
};

outputs = { self, nixpkgs, nixos-hardware, home-manager, nixvim, stylix, ... }@inputs:
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
			./configuration.nix
			./tuxedo.nix
			nixos-hardware.nixosModules.tuxedo-pulse-14-gen3

			stylix.nixosModules.stylix
			home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.backupFileExtension = "backup";
				home-manager.users.viktor = import ./home;
			}
		];
	};
};
}
