{ config, ... }:
{

services.syncthing = {
	enable = true;
	# openDefaultPorts = false;

	# Default address for the web gui: 127.0.0.1:8384
	# To change this use
	# guiAddress = "127.0.0.1:6969"

	user = "viktor";
	dataDir = "/home/viktor/syncthing";
};

}