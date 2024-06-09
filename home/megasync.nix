{ config, pkgs, ... }:
{

xdg.configFile."autostart/megasync.desktop".text = ''
[Desktop Entry]
Categories=Network;System;
Comment=Easy automated syncing between your computers and your MEGA cloud drive.
Exec=megasync
GenericName=File Synchronizer
Icon=mega
Name=MEGAsync
StartupNotify=false
Terminal=false
TryExec=megasync
Type=Application
Version=1.0
X-GNOME-Autostart-Delay=60
'';

}