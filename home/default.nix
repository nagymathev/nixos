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

<<<<<<< HEAD
home.file."${config.xdg.configHome}/nvim/" = {
	source = config.lib.file.mkOutOfStoreSymlink inputs.nvim;
	recursive = true;
};

=======
>>>>>>> parent of dcc1bc5 (add peter's nvim config)
programs.git = {
	enable = true;
	userName = "nagymathev";
	userEmail = "nagymathev@gmail.com";
};

home.stateVersion = "24.05";
programs.home-manager.enable = true;

}
