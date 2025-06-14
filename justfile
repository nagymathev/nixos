alias s := switch
alias u := update
alias uh := update-home
alias t := test

switch:
	rm ~/.gtkrc-2.0.hmbackup
	find ~/.config -name "*.hmbackup" -print -delete
	sudo nixos-rebuild switch --flake .
boot:
	sudo nixos-rebuild boot
update:
	nix flake update
update-home:
	sudo nix flake lock --update-input home-manager
test:
	sudo nixos-rebuild test --option eval-cache false
gc:
	nix-store --gc
gens:
	nixos-rebuild list-generations
