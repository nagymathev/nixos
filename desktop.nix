{ config, pkgs, ... }:
{

# Enable the X11 windowing system.
services.xserver.enable = true;
services.xserver.dpi = 144;

services.xserver.windowManager.i3.enable = true;

# Enable the KDE Plasma Desktop Environment.
services.desktopManager.plasma6.enable = true;
services.displayManager.sddm.enable = true;

programs.hyprland.enable = true;

environment.systemPackages = with pkgs; [
	wofi
	swww
];

}
