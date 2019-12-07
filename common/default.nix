{ lib, pkgs, ... }:

let
  nur-source = builtins.fetchTarball {
    url = "https://github.com/nix-community/nur-combined/archive/a9182c53221855ba3614c529e99b2dceea7329b8.tar.gz";
    sha256 = "12h964822j3d7xdq9lx22h74qp6wvzhjibi4hppy0lnnppaxqhqw";
  };
  nur-no-pkgs = import nur-source { };
  nur.modules = builtins.mapAttrs (_: r: r.modules) nur-no-pkgs.repos;
  nur.overlays = builtins.mapAttrs (_: r: r.overlays) nur-no-pkgs.repos;
in

{
  imports = [
    nur.modules.lourkeur.gnome3-fix-extra-layouts
  ];

  lib.data.lourkeur.keys.ssh.nitrokey = ./id_gpgcard.pub;
}
