{ config, lib, pkgs, ... }:
{

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

}
