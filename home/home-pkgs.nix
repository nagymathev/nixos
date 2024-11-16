{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    steam
    protonup-qt
    heroic
    bottles
    lutris
    prismlauncher
    megasync
    obsidian
    anki-bin
    vesktop
    calibre
    okular

    jetbrains.clion

    mangohud

    kitty
  ];
}
