{ config, pkgs, ... }:
{

home.packages = with pkgs; [
	steam
	protonup-qt
	heroic
	bottles
	lutris
	prismlauncher
	megasync
	obsidian
	anki-bin

	jetbrains.clion

	mangohud

	kitty
];
	
}