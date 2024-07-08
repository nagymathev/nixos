{ config, pkgs, inputs, ... }:

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

home.file."${config.xdg.configHome}/nvim/" = {
	source = inputs.nvim;
	recursive = true;
};

programs.git = {
	enable = true;
	userName = "nagymathev";
	userEmail = "nagymathev@gmail.com";
};

home.stateVersion = "24.05";
programs.home-manager.enable = true;

}
