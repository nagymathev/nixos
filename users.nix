{ config, pkgs, ... }:
{

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.viktor = {
	isNormalUser = true;
	description = "viktor";
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [
		firefox
		discord
		thunderbird
	];
};

}
