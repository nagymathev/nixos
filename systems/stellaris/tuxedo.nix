{...}: {
  hardware.tuxedo-rs.enable = true;
  hardware.tuxedo-rs.tailor-gui.enable = true;
  hardware.tuxedo-drivers.enable = true;

  boot = {
    # Disable backlight with 0 brightness
    kernelParams = [
      "tuxedo_keyboard.mode=0"
      "tuxedo_keyboard.brightness=0"
      "tuxedo_keyboard.color_left=0x000000"
    ];
  };
}
