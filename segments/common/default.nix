let
  nur-source = builtins.fetchTarball {
    url = "https://github.com/nix-community/nur-combined/archive/a3f6e1bd865c0cd6fc42327509486c66991bbaa8.tar.gz";
    sha256 = "05f4rzhf8hm3nwqwr5qkjj2rx5yl2jkc8lxq3973cqrqcx2kzvfz";
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
