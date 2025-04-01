{
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.viktor = {
    isNormalUser = true;
    description = "viktor";
    hashedPassword = "$y$j9T$LGJSMQmQVLLsGxnwwG9Bi/$g7SURzJ453pqVUgJmCotMZ.gBif8cSPK3o16UcxB6.7";
    extraGroups = ["networkmanager" "wireshark" "wheel" "docker" "video" "dialout"];
    packages = with pkgs; [
      firefox
      discord
      thunderbird
      bitwarden-desktop
      protonup-qt
      heroic
      bottles
      lutris
      prismlauncher
      obsidian
      anki-bin
      vesktop
      kdePackages.okular
      spotube
      youtube-music

      mangohud

      kitty

    ];
  };
}
