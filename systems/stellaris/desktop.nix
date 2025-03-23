{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.dpi = 96;

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = false;
  services.displayManager.sddm.enable = false;
  services.displayManager.sddm.wayland.enable = false;

  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.cinnamon.enable = false;
  services.xserver.desktopManager.enlightenment.enable = false;
  services.xserver.displayManager.gdm.enable = true;

  programs.hyprland.enable = false;
  programs.niri.enable = false;

  environment.systemPackages = with pkgs; [
    wofi
    swww
    eww
    mako
    libnotify

    niri # scrolling window manager
    fuzzel # app finder for niri, similar to wofi
    waybar # bar for niri
    swaylock
    playerctl # controlling media players (eg. play/pause toggle)
    xwayland-satellite # needed for niri to be able to use x11 apps
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
  ];
}
