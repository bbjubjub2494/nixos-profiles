# A customized Raspberry Pi installer image w/o a desktop environment.
# Features:
#   - Fish shell with my preferred prompt.
#   - My text editor and pager are available.
#   - My custom keyboard layout is set by default.
#   - I can log in via SSH using public key authentication.
#   - My native language & timezone.
#   - Rogue on tty8.

{
  imports = [
    # reuse a config from NixOS
    <nixpkgs/nixos/modules/installer/cd-dvd/sd-image-aarch64.nix>

    ./installer-common.nix
  ];

  # Leverage Hydra binary cache. Requires segments/cross-compilation in the build host.
  nixpkgs.system = "aarch64-linux";
}
