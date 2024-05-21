alias s := switch
alias u := update
alias uh := update-home
alias t := test

switch:
	sudo nixos-rebuild switch
boot:
	sudo nixos-rebuild boot
update:
	sudo nix flake update
update-home:
	sudo nix flake lock --update-input home-manager
test:
	sudo nixos-rebuild test --option eval-cache false
gc:
	nix-store --gc
