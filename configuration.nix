# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let

in {
imports =
[ # Include the results of the hardware scan.
	./hardware-configuration.nix
	./nvidia.nix
	./specialisations.nix
	./localisation.nix
	./keyboard.nix
	./audio.nix
	./users.nix
	./networking.nix
	./grub.nix
	./system-pkgs.nix
	./nix-settings.nix
	./kernel.nix
	./desktop.nix
	./tmux.nix

	inputs.nixvim.nixosModules.nixvim
];

programs.nixvim = {
	enable = true;
	colorschemes.gruvbox.enable = true;

	opts = {
		relativenumber = true;

		ignorecase = true;
		smartcase = true;

		scrolloff = 10;

	};

	globals.mapleader = " ";

	plugins = {
		cmp.enable = true;
		cmp-nvim-lsp.enable = true;
		treesitter.enable = true;
		nvim-autopairs.enable = true;
		clangd-extensions.enable = true;
		lsp = {
			enable = true;
			servers = {
				# Markdown
				marksman.enable = true;
				# Nix
				nil_ls.enable = true;
				# Bash
				bashls.enable = true;
				# C/C++
				clangd.enable = true;
				# Docker
				dockerls.enable = true;
				# Python
				pyright.enable = true;
			};
		};

		telescope = {
			enable = true;
			extensions = {
				fzf-native.enable = true;
			};
		};

		lualine.enable = true;
		bufferline.enable = true;
		oil.enable = true;

		markdown-preview = {
			enable = true;
			settings.theme = "dark";
		};
	};
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
