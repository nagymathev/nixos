{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./steam.nix
    ./hyprland.nix
    ./megasync.nix
    ./zsh.nix
    ./niri.nix
    ./waybar.nix
  ];

  home.username = "viktor";
  home.homeDirectory = "/home/viktor";

  programs.git = {
    enable = true;
    userName = "nagymathev";
    userEmail = "nagymathev@gmail.com";
  };

  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
  home.pointerCursor = {
    gtk.enable = true;
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 32;
    x11.enable = true;
    x11.defaultCursor = "Vanilla-DMZ";
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
