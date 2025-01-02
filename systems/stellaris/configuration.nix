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

  environment.variables = {
    NVIM_PROFILE = "HOME"; # this is for the independent nvim configuration at nagymathev/nvim
    QT_QPA_PLATFORM = ''"wayland;xcb"'';
    QT_STYLE_OVERRIDE = "adwaita";
    EDITOR = "nvim";

    # These are meant to fix what looks to be lower frame rates on external monitors
#    KWIN_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1"; # setting devices used by kwin (kde)
#    OGL_DEDICATED_HW_STATE_PER_CONTEXT = "ENABLE_ROBUST"; # nvidia's solution, apparently doesn't work, worth a try
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

  virtualisation.virtualbox = {
    guest.enable = true;
    host = {
      enable = true;
      enableKvm = true;
      addNetworkInterface = false;
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.direnv.enable = true;
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  services.flatpak.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  fonts.packages = with pkgs; [
    fira-code-nerdfont
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
