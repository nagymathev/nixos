{ config, ... }:
{

nix.gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 2w";
};

}