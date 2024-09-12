{ config, ... }:
{
  imports = [
    ./audio.nix
    ./desktop.nix
    ./hardware-configuration.nix
    ./kernel.nix
    ./networking.nix
    ./nvidia.nix
    ./nvim-lsp.nix
    ./specialisations.nix
    ./syncthing.nix
    ./tuxedo.nix
    ./configuration.nix

    # Common
    ../common
  ];
}
