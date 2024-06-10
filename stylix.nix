{ config, pkgs, ... }:
{
	
	stylix = {
		enable = true;
		image = ./assets/stargate.png;
		polarity = "dark";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		
		fonts = {
			monospace = {
				package = pkgs.fira-code-nerdfont;
				name = "FiraCode Nerd Font";
			};
			serif = config.stylix.fonts.monospace;
			sansSerif = config.stylix.fonts.monospace;
			emoji = config.stylix.fonts.monospace;
		};
	};

}