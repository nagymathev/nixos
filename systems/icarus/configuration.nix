# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../modules/dev/python.nix
  ];

  modules.python.enable = true;

  programs.steam.enable = true;

  environment.variables = {
    NVIM_PROFILE = "HOME"; # this is for the independent nvim configuration at nagymathev/nvim
    QT_QPA_PLATFORM = ''"wayland;xcb"'';
    QT_STYLE_OVERRIDE = "adwaita";
    EDITOR = "nvim";
  };

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  hardware.enableAllFirmware = true;

  programs.nix-ld = {
    enable = true;
    libraries = pkgs.steam-run.args.multiPkgs pkgs;
  };

  # Virtualbox
  virtualisation.virtualbox = {
    guest.enable = true;
    guest.dragAndDrop = true;
    host = {
      enable = true;
      enableKvm = false;
      addNetworkInterface = true;
    };
  };
  users.extraGroups.vboxusers.members = [ "viktor" ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.direnv.enable = true;
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  services.flatpak.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    font-awesome # required for waybar icons
  ];

  fonts.fontconfig = {
    enable = true;
    subpixel.rgba = "rgb";
    subpixel.lcdfilter = "legacy";
    hinting.style = "full";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
