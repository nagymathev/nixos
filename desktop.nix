{ config, pkgs, ... }:
{

# Enable the X11 windowing system.
services.xserver.enable = true;
services.xserver.dpi = 144;

services.xserver.windowManager.i3.enable = true;

# Enable the KDE Plasma Desktop Environment.
services.desktopManager.plasma6.enable = false;
services.displayManager.sddm.enable = false;

services.xserver.desktopManager.gnome.enable = true;
services.xserver.displayManager.gdm.enable = true;

programs.hyprland.enable = true;

environment.systemPackages = with pkgs; [
	wofi
	swww
];

}
