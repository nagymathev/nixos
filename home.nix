{ config, pkgs, ... }:

{

imports = [
	./home/kitty.nix
	./home/steam.nix
	./home/hyprland.nix
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
	anki-bin

	mangohud

	kitty
];

programs.git = {
	enable = true;
	userName = "nagymathev";
	userEmail = "nagymathev@gmail.com";
};

programs.zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;

	shellAliases = {
		g = "git";
		gs = "git status";
		ga = "git add";
		gd = "git diff";
		gds = "git diff --staged";
		gc = "git commit -m";
		gp = "git push";
		
		ll = "ls -l";
		la = "ls -al";
	};

	oh-my-zsh = {
		enable = true;
		plugins = [
			"git"
			"direnv"
		];
		theme = "philips";
	};

	initExtra = ''
bindkey '\e[H' beginning-of-line
bindkey '\eOH' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\eOF' end-of-line
	'';
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
