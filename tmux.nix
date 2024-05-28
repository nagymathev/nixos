{ config, pkgs, ... }:
{

programs.tmux = {
	enable = true;
	keyMode = "vi";
	shortcut = "a";
	plugins = with pkgs.tmuxPlugins; [
		gruvbox
		resurrect
	];
};

}
