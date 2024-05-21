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
	lutris
	prismlauncher
	megasync
	obsidian
	anki

	mangohud
	gamemode

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

xdg.configFile."autostart/megasync.desktop".text = ''
[Desktop Entry]
Categories=Network;System;
Comment=Easy automated syncing between your computers and your MEGA cloud drive.
Exec=megasync
GenericName=File Synchronizer
Icon=mega
Name=MEGAsync
StartupNotify=false
Terminal=false
TryExec=megasync
Type=Application
Version=1.0
X-GNOME-Autostart-Delay=60
'';

home.stateVersion = "24.05";
programs.home-manager.enable = true;

}
