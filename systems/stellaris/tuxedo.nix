{ config, pkgs, inputs, ... }:
{

  # hardware.tuxedo-keyboard.enable = true;

  disabledModules = [
    "hardware/tuxedo-keyboard.nix"
    "services/hardware/tuxedo-rs.nix"
  ];

  imports = [
    "${inputs.tuxedo}/nixos/modules/hardware/tuxedo-drivers.nix"
    "${inputs.tuxedo}/nixos/modules/services/hardware/tuxedo-rs.nix"
  ];

  # hardware.tuxedo-drivers.enable = true;
  hardware.tuxedo-rs.enable = true;
  hardware.tuxedo-rs.tailor-gui.enable = true;


  boot = {
    kernelPackages = pkgs.linuxPackages_latest.extend (final: prev: {
      tuxedo-drivers = inputs.tuxedo.legacyPackages.x86_64-linux.linuxKernel.packages.linux_latest.tuxedo-drivers;
    });

    # Disable backlight with 0 brightness
    kernelParams = [
      "tuxedo_keyboard.mode=0"
      "tuxedo_keyboard.brightness=0"
      "tuxedo_keyboard.color_left=0x000000"
    ];
  };

  hardware.tuxedo-drivers.enable = true;

}
