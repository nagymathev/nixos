{ config, pkgs, ... }:

{

home.username = "viktor";
home.homeDirectory = "/home/viktor";

home.packages = with pkgs; [
];

programs.git = {
	enable = true;
	userName = "nagymathev";
	userEmail = "nagymathev@gmail.com";
};

home.file.".steam/steam/steam_dev.cfg".text = ''
@nClientDownloadEnableHTTP2PlatformLinux 0
@fDownloadRateImprovementToAddAnotherConnection 1.0
'';

home.stateVersion = "23.11";
programs.home-manager.enable = true;

}
