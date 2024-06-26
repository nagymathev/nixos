# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let

in {
imports =
[ # Include the results of the hardware scan.
	./hardware-configuration.nix
	./inputs.nix
	./gc.nix
	./nvidia.nix
	./specialisations.nix
	./localisation.nix
	./keyboard.nix
	./audio.nix
	./users.nix
	./networking.nix
	./boot.nix
	./system-pkgs.nix
	./nix-settings.nix
	./kernel.nix
	./desktop.nix
	./tmux.nix
	./nixvim.nix
	./stylix.nix
	./syncthing.nix

	inputs.nixvim.nixosModules.nixvim
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
