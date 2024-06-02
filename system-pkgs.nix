{ config, pkgs, ... }:
{

environment.systemPackages = with pkgs; [
	vim
	neovim
	git
	wget
	curl
	ripgrep
	fzf
	btop
	just

	zip
	xz
	unzip
	p7zip

	pciutils
	usbutils
	lm_sensors

	libclang
];

}
