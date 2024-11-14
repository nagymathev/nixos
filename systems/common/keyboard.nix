{config, pkgs, lib, ... }:
{

# Mouse and keyboard preferences
services.libinput.mouse.accelProfile = "flat";
services.libinput.mouse.accelSpeed = "0";

services.libinput.touchpad.naturalScrolling = true;

environment.variables = {
	XCURSOR_SIZE = lib.mkForce "32";
};

# Configure keymap in X11
services.xserver = {
	xkb.layout = "gb";
	xkb.variant = "";
};

# Configure console keymap
console.keyMap = "uk";

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Meant to solve the issue when KDE doesn't acknowledge the keyboard when waking from sleep without closing the lid
powerManagement.powerUpCommands = "sudo rmmod atkbd; sudo modprobe atkbd reset=1";
powerManagement.resumeCommands = "${pkgs.kmod}/bin/rmmod atkbd; ${pkgs.kmod}/bin/modprobe atkbd reset=1";

}
