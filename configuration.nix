# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let

in {
imports =
[ # Include the results of the hardware scan.
	./hardware-configuration.nix
	./nvidia.nix
	./specialisations.nix
];

boot.kernelPackages = pkgs.linuxPackages_zen;

# Bootloader.
boot.loader = {
	timeout = 5;
	
	efi = {
		efiSysMountPoint = "/boot";
	};
	
	grub = {
		enable = true;
		devices = [ "nodev" ];
		efiSupport = true;
		efiInstallAsRemovable = true;
	};
};

networking.hostName = "stellaris"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
networking.networkmanager.enable = true;

# Set your time zone.
time.timeZone = "Europe/Budapest";

# Select internationalisation properties.
i18n.defaultLocale = "en_GB.UTF-8";

i18n.extraLocaleSettings = {
	LC_ADDRESS = "en_GB.UTF-8";
	LC_IDENTIFICATION = "en_GB.UTF-8";
	LC_MEASUREMENT = "en_GB.UTF-8";
	LC_MONETARY = "en_GB.UTF-8";
	LC_NAME = "en_GB.UTF-8";
	LC_NUMERIC = "en_GB.UTF-8";
	LC_PAPER = "en_GB.UTF-8";
	LC_TELEPHONE = "en_GB.UTF-8";
	LC_TIME = "en_GB.UTF-8";
};

# Enable the X11 windowing system.
services.xserver.enable = true;

# Enable the GNOME Desktop Environment.
#services.xserver.displayManager.gdm.enable = true;
#services.xserver.desktopManager.gnome.enable = true;

# Enable the KDE Plasma Desktop Environment.
services.desktopManager.plasma6.enable = true;
services.displayManager.sddm.enable = true;

# Do not enable tuxedo-rs, it makes things run poorly.
# Well it runs poorly if the profile is set anything but default.
# This bug is very silly and I hate it.
hardware.tuxedo-keyboard.enable = true;
hardware.tuxedo-rs.enable = true;
hardware.tuxedo-rs.tailor-gui.enable = true;

# Configure keymap in X11
services.xserver = {
	xkb.layout = "gb";
	xkb.variant = "";
};

# Configure console keymap
console.keyMap = "uk";

# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound with pipewire.
sound.enable = true;
hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	# If you want to use JACK applications, uncomment this
	#jack.enable = true;

	# use the example session manager (no others are packaged yet so this is enabled by default,
	# no need to redefine it in your config for now)
	#media-session.enable = true;
};

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

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

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
nix.settings.experimental-features = [ "nix-command" "flakes" ];
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

	libgcc
	gnumake
	nodejs_22

	zip
	xz
	unzip
	p7zip

	pciutils
	usbutils
	lm_sensors
	
	tmux
];
environment.variables.EDITOR = "nvim";
programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;
fonts.packages = with pkgs; [
	fira-code-nerdfont
];

# Meant to solve the issue when KDE doesn't acknowledge the keyboard when waking from sleep without closing the lid
powerManagement.powerUpCommands = "sudo rmmod atkbd; sudo modprobe atkbd reset=1";
powerManagement.resumeCommands = "${pkgs.kmod}/bin/rmmod atkbd; ${pkgs.kmod}/bin/modprobe atkbd reset=1";

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "unstable"; # Did you read the comment?

}
