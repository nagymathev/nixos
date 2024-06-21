{ config, pkgs, ... }:
{

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
				nil-ls.enable = true;
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
		# Rust
		rustaceanvim = {
			enable = true;
		};

		telescope = {
			enable = true;
			extensions = {
				fzf-native.enable = true;
			};
			keymaps = {
				"<leader>ff" = "find_files";
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
}