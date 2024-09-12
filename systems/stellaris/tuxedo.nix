{ config, pkgs, ... }:
{

# Do not enable tuxedo-rs, it makes things run poorly.
# Well it runs poorly if the profile is set anything but default.
# This bug is very silly and I hate it.
hardware.tuxedo-keyboard.enable = true;
hardware.tuxedo-rs.enable = true;
hardware.tuxedo-rs.tailor-gui.enable = true;

# Disable backlight with 0 brightness
boot.kernelParams = [
	"tuxedo_keyboard.mode=0"
	"tuxedo_keyboard.brightness=0"
	"tuxedo_keyboard.color_left=0x000000"
];

}
