{config, ...}: {
  imports = [
    ../common
    ./networking.nix
    ./hardware-configuration.nix
  ];

  services.netdata.enable = true;
}
