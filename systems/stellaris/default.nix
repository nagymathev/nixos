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
    ../common/configuration.nix
    ../common/gc.nix
    ../common/tmux.nix
    ../common/users.nix
    ../common/keyboard.nix
    ../common/system-pkgs.nix
    ../common/localisation.nix
    ../common/nix-settings.nix
    ../common/docker.nix

    # Other
    ../../boot.nix
  ];
}
