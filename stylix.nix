{ config, pkgs, ... }:
{
	
stylix = {
	enable = true;
	image = ./assets/statue.png;
	polarity = "dark";
	base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

	cursor.package = pkgs.kdePackages.breeze;
	cursor.name = "Breeze_Light";
	cursor.size = 24;
	
	fonts = {
		monospace = {
			package = pkgs.fira-code-nerdfont;
			name = "FiraCode Nerd Font";
		};
	};
	
	targets.grub.enable = true;
	targets.grub.useImage = true;
};

environment.variables = {
	XCURSOR_SIZE = 36;
};

}
