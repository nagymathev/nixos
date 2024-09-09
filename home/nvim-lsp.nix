{ config, pkgs, ... }:
{
	home.packages = with pkgs [
		nixd
		dockerfile-language-server-nodejs
		docker-compose-language-service
	];
}
