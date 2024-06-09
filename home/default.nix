{ ionfig, pkgs, ... }:

{

imports = [
	./home-pkgs.nix
	./kitty.nix
	./steam.nix
	./hyprland.nix
	./megasync.nix
	./pt8.nix
	./zsh.nix
];

home.username = "viktor";
home.homeDirectory = "/home/viktor";

programs.git = {
	enable = true;
	userName = "nagymathev";
	userEmail = "nagymathev@gmail.com";
};

home.stateVersion = "24.05";
programs.home-manager.enable = true;

}
