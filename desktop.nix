{ config, pkgs, ... }:
{

# Enable the X11 windowing system.
services.xserver.enable = true;

# Enable the KDE Plasma Desktop Environment.
services.desktopManager.plasma6.enable = true;
services.displayManager.sddm.enable = true;

}
