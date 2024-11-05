{ config, ... }:
{
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos/home/config/waybar";
}
