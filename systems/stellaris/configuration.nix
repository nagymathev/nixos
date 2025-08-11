# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{
  imports = [
    ../../modules/dev/python.nix
    ../../modules/dev/tailscale.nix
  ];

  modules.python.enable = true;
  modules.tailscale = {
    enable = true;
    autoconnect = true;
    authKey = config.sops.secrets.tskey-auth.path;
  };
  sops.secrets.tskey-auth = { };

  services.k3s.enable = true;
  services.k3s.role = "server";

  programs.steam.enable = true;

  environment.variables = {
    NVIM_PROFILE = "HOME"; # this is for the independent nvim configuration at nagymathev/nvim
    QT_QPA_PLATFORM = ''"wayland;xcb"'';
    QT_STYLE_OVERRIDE = "adwaita";
    EDITOR = "nvim";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services.udev.extraRules = lib.mkMerge [
    ''
      ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils-full}/bin/chgrp video /sys/class/backlight/amdgpu_bl1/brightness", RUN+="${pkgs.coreutils-full}/bin/chmod g+w /sys/class/backlight/amdgpu_bl1/brightness"
    ''
  ];

  hardware.enableAllFirmware = true;

  programs.nix-ld = {
    enable = true;
    libraries = pkgs.steam-run.args.multiPkgs pkgs;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Useful for sharing data between phone and pc on local network
  programs.kdeconnect.enable = true;

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
