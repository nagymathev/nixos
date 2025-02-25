{config, ...}: {
  imports = [
    ./audio.nix
    ./desktop.nix
    ./hardware-configuration.nix
    ./kernel.nix
    ./networking.nix
    ./nvim-lsp.nix
    ./syncthing.nix
    ./configuration.nix
    ./graphics.nix

    # Common
    ../common
  ];
}
