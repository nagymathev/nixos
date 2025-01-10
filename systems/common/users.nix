{
  config,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.viktor = {
    isNormalUser = true;
    description = "viktor";
    hashedPassword = "$y$j9T$LGJSMQmQVLLsGxnwwG9Bi/$g7SURzJ453pqVUgJmCotMZ.gBif8cSPK3o16UcxB6.7";
    extraGroups = ["networkmanager" "wireshark" "wheel" "docker" "video"];
    packages = with pkgs; [
      firefox
      discord
      thunderbird
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
      spotube
      freecad

      jetbrains.clion

      mangohud

      kitty
    ];
  };
}
