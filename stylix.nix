{ config, pkgs, lib, ... }:
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

# Change the cursor size to what it would be under 150% scaling with 24px cursors
# This is because some apps running electron or else can't properly query the global
# scaling or just don't manage the cursor under the wayland protocol.
# This feels like a hacky solution and I hate it.
environment.variables = {
	XCURSOR_SIZE = lib.mkForce 36;
};

}
