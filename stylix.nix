{ config, pkgs, ... }:
{
	
	stylix = {
		enable = true;
		image = ./assets/stargate.png;
		polarity = "dark";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		
		cursor.size = 24;
		
		fonts = {
			monospace = {
				package = pkgs.fira-code-nerdfont;
				name = "FiraCode Nerd Font";
			};
			serif = config.stylix.fonts.monospace;
			sansSerif = config.stylix.fonts.monospace;
			emoji = config.stylix.fonts.monospace;
		};
		
		targets.grub.enable = true;
		targets.grub.useImage = true;
	};

}