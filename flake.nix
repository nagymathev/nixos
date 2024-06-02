{
description = "My NixOS Flake";

inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	nixvim = {
		url = "github:nix-community/nixvim";
		inputs.nixpkgs.follows = "nixpkgs";
	};
};

outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
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
		};
		modules = [
			./configuration.nix

			home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.viktor = import ./home.nix;
			}
		];
	};
};
}
