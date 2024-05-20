{ config, pkgs, ... }:

{

imports = [
	./home/kitty.nix
	./home/steam.nix
];

home.username = "viktor";
home.homeDirectory = "/home/viktor";

home.packages = with pkgs; [
	steam
	protonup-qt
	heroic
	bottles
	prismlauncher
	megasync
	obsidian
	anki

	kitty
];

programs.git = {
	enable = true;
	userName = "nagymathev";
	userEmail = "nagymathev@gmail.com";
};

home.stateVersion = "24.05";
programs.home-manager.enable = true;

}
