{ config, lib, pkgs }:

with lib;

let
  cfg = modules.python;
in {
  options.modules.python = {
    enable = mkEnableOption "python tools";
    extraPkgs = mkOption {
      default = [];
      example = ''
        [ python312Packages.pygame ]
      '';
      type = types.listOf types.package;
      description = ''
        Extra packages for python development.
      '';
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python3
      python3Packages.pip
    ]
    # Extras
    ++ cfg.extraPkgs;
  };
}
