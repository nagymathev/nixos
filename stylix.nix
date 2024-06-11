{ config, pkgs, ... }:
{
	
	stylix = {
		enable = true;
		image = ./assets/statue.png;
		polarity = "dark";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		
		fonts = {
			monospace = {
				package = pkgs.fira-code-nerdfont;
				name = "FiraCode Nerd Font";
			};
		};
		
		targets.grub.enable = true;
		targets.grub.useImage = true;
	};

}
