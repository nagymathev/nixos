{ config, pkgs, inputs, ... }:
{

# Do not enable tuxedo-rs, it makes things run poorly.
# Well it runs poorly if the profile is set anything but default.
# This bug is very silly and I hate it.
# hardware.tuxedo-keyboard.enable = true;
hardware.tuxedo-rs.enable = true;
hardware.tuxedo-rs.tailor-gui.enable = true;

disabledModules = [
	"hardware/tuxedo-keyboard.nix"
	"services/hardware/tuxedo-rs.nix"
];

import = [
	"${inputs.tuxedo}/nixos/modules/hardware/tuxedo-drivers.nix"
	"${inputs.tuxedo}/nixos/modules/services/hardware/tuxedo-rs.nix"
];

hardware.tuxedo-drivers.enable = true;

boot.kernelPackages = pkgs.linuxKernel.packages.linux_X_X.extend (final: prev: {
	tuxedo-drivers = inputs.tuxedo.legacyPackages.x86_64-linux.linuxKernel.packages.linux_X_X.tuxedo-drivers;
});

# Disable backlight with 0 brightness
boot.kernelParams = [
	"tuxedo_keyboard.mode=0"
	"tuxedo_keyboard.brightness=0"
	"tuxedo_keyboard.color_left=0x000000"
];

}
