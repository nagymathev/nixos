{config, ...}: {
  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos/home/config/niri/config.kdl";
}
