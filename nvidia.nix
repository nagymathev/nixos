{ config, lib, pkgs, ... }: let

nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload"
	''
	export __NV_PRIME_RENDER_OFFLOAD=1
	export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
	export __GLX_VENDOR_LIBRARY_NAME=nvidia
	export __VK_LAYER_NV_optimus=NVIDIA_only
	exec "$@"
	'';

in {

environment.systemPackages = with pkgs; [
	nvidia-offload
];

hardware.opengl = {
	enable = true;
	driSupport = true;
	driSupport32Bit = true;
};

services.xserver.videoDrivers = [ "nvidia" ];

hardware.nvidia = {
	modesetting.enable = true;
	powerManagement.enable = true;
	powerManagement.finegrained = true;
	open = false; # Open Source driver
	nvidiaSettings = true;
	package = config.boot.kernelPackages.nvidiaPackages.stable;
	
	prime = {
		offload.enable = true;
		offload.enableOffloadCmd = true;
		
		nvidiaBusId = "PCI:1:0:0";
		amdgpuBusId = "PCI:6:0:0";
	};
};

}
