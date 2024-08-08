{ config, pkgs, ... }:
{

networking.hostName = "stellaris"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

networking.hosts = {
	"127.0.0.1:8384" = [ "syncthing" ];
};

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
networking.networkmanager.enable = true;

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

}
