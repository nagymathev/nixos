{
  config,
  pkgs,
  ...
}: {
  networking.hostName = "equuleus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22 # Shh
    25565 # Minecraft server
    19999 # NetData
  ];
  networking.firewall.allowedUDPPorts = [25565];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
