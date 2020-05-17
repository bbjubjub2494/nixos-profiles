.PHONY: .FORCE lint

workstation/%: target=config.system
minimal-installer/%: target=config.system.build.isoImage
graphical-installer/%: target=config.system.build.isoImage
raspberrypi3/%: target=config.system.build.sdImage
gnmbox/%: target=vm
kdebox/%: target=vm

export NIXOS_CONFIG
workstation/%: NIXOS_CONFIG=$(PWD)/workstation.nix
minimal-installer/%: NIXOS_CONFIG=$(PWD)/minimal-installer.nix
graphical-installer/%: NIXOS_CONFIG=$(PWD)/graphical-installer.nix
raspberrypi3/%: NIXOS_CONFIG=$(PWD)/raspberrypi3.nix
gnmbox/%: NIXOS_CONFIG=$(PWD)/gnmbox.nix
kdebox/%: NIXOS_CONFIG=$(PWD)/kdebox.nix

%/build: .FORCE
	nix-build -o $@ '<nixpkgs/nixos>' -A $(target)
%/instantiate: .FORCE
	nix-instantiate --add-root $@ --indirect '<nixpkgs/nixos>' -A $(target)

lint:
	@find -name '*.nix' | xargs nix-linter -j \
		| jq -r '"\(.file):\(.pos.spanBegin.sourceLine):\(.description)"'

install:
	ln -sfT $(realpath .) /etc/nixos/profiles
