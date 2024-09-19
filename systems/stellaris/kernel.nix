{ config, lib, pkgs, ... }:
{

  # Can't go to higher kernel versions otherwise the tuxedo-drivers module won't work
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_9;

}
