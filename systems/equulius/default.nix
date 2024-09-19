{ config, ... }:
{
  imports = [
    ../common
    ./networking.nix
    ./hardware-configuration.nix
  ];
}
