{config, ...}: {
  imports = [
    ./configuration.nix
    ./docker.nix
    ./gc.nix
    ./keyboard.nix
    ./localisation.nix
    ./nix-settings.nix
    ./system-pkgs.nix
    ./tmux.nix
    ./users.nix
    ./boot.nix
    ./kernel.nix
  ];
}
