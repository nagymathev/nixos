{ config, pkgs, ... }:
{
	
xdg.desktopEntries.ciscoPacketTracer8 = {
	name = "Cisco Packet Tracer 8";
	exec = "XDG_CURRENT_DESKTOP=GNOME packettracer8 %f";
};

}