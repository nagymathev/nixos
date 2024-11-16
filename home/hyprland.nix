{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    dunst
    swww
    ags
  ];

  xdg.configFile."hypr/hyprland.conf".force = true;
  xdg.configFile."hypr/hyprland.conf".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos/home/config/hyprland.conf";
}
