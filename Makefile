.PHONY: .FORCE lint

workstation/%: target=config.system
minimal-installer/%: target=config.system.build.isoImage
graphical-installer/%: target=config.system.build.isoImage

export NIXOS_CONFIG
workstation/%: NIXOS_CONFIG=$(PWD)/workstation.nix
minimal-installer/%: NIXOS_CONFIG=$(PWD)/minimal-installer.nix
graphical-installer/%: NIXOS_CONFIG=$(PWD)/graphical-installer.nix

%/build: .FORCE
	nix-build -o $@ '<nixpkgs/nixos>' -A $(target)
%/instantiate: .FORCE
	nix-instantiate --add-root $@ --indirect '<nixpkgs/nixos>' -A $(target)

lint:
	find -name '*.nix' | xargs nix-linter -j \
		| jq -r '"\(.file):\(.pos.spanBegin.sourceLine):\(.description)"'
