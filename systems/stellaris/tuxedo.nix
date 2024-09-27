{ config, pkgs, inputs, ... }:
{

  # disabledModules = [
  #   "hardware/tuxedo-keyboard.nix"
  #   "services/hardware/tuxedo-rs.nix"
  # ];
  #
  # imports = [
  #   "${inputs.tuxedo}/nixos/modules/hardware/tuxedo-drivers.nix"
  #   "${inputs.tuxedo}/nixos/modules/services/hardware/tuxedo-rs.nix"
  # ];

  hardware.tuxedo-rs.enable = true;
  hardware.tuxedo-rs.tailor-gui.enable = true;
  hardware.tuxedo-drivers.enable = true;


  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_6_11.extend (final: prev: {
      tuxedo-drivers = inputs.tuxedo.legacyPackages.x86_64-linux.linuxKernel.packages.linux_6_11.tuxedo-drivers;
    });

    # Disable backlight with 0 brightness
    kernelParams = [
      "tuxedo_keyboard.mode=0"
      "tuxedo_keyboard.brightness=0"
      "tuxedo_keyboard.color_left=0x000000"
    ];
  };


}
