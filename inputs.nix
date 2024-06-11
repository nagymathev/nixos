{ config, pkgs, ... }:
{
	services.libinput.mouse.accelProfile = "flat";
	services.libinput.mouse.accelSpeed = 0;

	services.libinput.touchpad.naturalScrolling = true;

}