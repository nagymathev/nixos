{ config, pkgs, ... }:

{

imports = [
	./home/kitty.nix
	./home/steam.nix
];

home.username = "viktor";
home.homeDirectory = "/home/viktor";

home.packages = with pkgs; [
	steam
	protonup-qt
	heroic
	bottles
	prismlauncher
	megasync
	obsidian
	anki

	kitty
];

programs.git = {
	enable = true;
	userName = "nagymathev";
	userEmail = "nagymathev@gmail.com";
};

xdg.desktopEntries.ciscoPacketTracer8 = {
	name = "Cisco Packet Tracer 8";
	exec = "XDG_CURRENT_DESKTOP=GNOME packettracer8 %f";
};

home.stateVersion = "24.05";
programs.home-manager.enable = true;

}
