# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let

in {
imports =
[
	# System
	./hardware-configuration.nix
	./gc.nix
	./nvidia.nix
	./specialisations.nix
	./localisation.nix
	./audio.nix
	./users.nix
	./networking.nix
	./boot.nix
	./nix-settings.nix
	./kernel.nix
	
	# Personal Settings
	./system-pkgs.nix
	./keyboard.nix
	./desktop.nix
	./tmux.nix
	./syncthing.nix
	# ./stylix.nix

];

programs.nix-ld = {
	enable = true;
	libraries = pkgs.steam-run.fhsenv.args.multiPkgs pkgs;
};

# Enable CUPS to print documents.
services.printing.enable = true;

programs.direnv.enable = true;
programs.gamemode.enable = true;
programs.gamescope.enable = true;

environment.variables.EDITOR = "nvim";
programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;
fonts.packages = with pkgs; [
	fira-code-nerdfont
];

fonts.fontconfig = {
	enable = true;
	subpixel.rgba = "rgb";
	subpixel.lcdfilter = "legacy";
	hinting.style = "full";
};


# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "unstable"; # Did you read the comment?

}
