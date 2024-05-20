{ config, ... }:

{

xdg.desktopEntries.steam = {
	name = "Steam";
	exec = "steam -forcedesktopscaling 1.6 %U";
};

}
