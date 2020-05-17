{ config, pkgs, ... }:

# A container than can run X applications and cant access the Internet except thru gateway containers that (hopefully) anonymize traffic.

{
  imports = [
    ./containers/torbox.nix
    ./containers/tor-gateway.nix
    ./containers/vpn-gateway.nix
  ];

  environment.systemPackages = [ pkgs.xpra ];
  nixpkgs.overlays = [ config.lib.overlays.patch-xpra ];

  containers.torbox.autoStart = true;
}
