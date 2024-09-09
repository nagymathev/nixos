{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		wl-clipboard
		tree-sitter
		nixd
		dockerfile-language-server-nodejs
		docker-compose-language-service
		rust-analyzer
		lua-language-server
		bash-language-server
		pylyzer
	];
}
