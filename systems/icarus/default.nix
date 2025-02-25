{config, ...}: {
  imports = [
    ./audio.nix
    ./desktop.nix
    ./hardware-configuration.nix
    ./kernel.nix
    ./networking.nix
    ./nvim-lsp.nix
    ./specialisations.nix
    ./syncthing.nix
    ./configuration.nix

    # Common
    ../common
  ];
}
