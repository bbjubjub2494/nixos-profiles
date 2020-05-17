let
  nur-source = builtins.fetchTarball {
    url = "https://github.com/nix-community/nur-combined/archive/4588996d758e00f8654ca25aa9a0eb5473264843.tar.gz";
    sha256 = "1l5h3crjvglynnz43bql8ickkfg4d5q0sa8ha1613dpp0d9g7d7n";
  };
  nur-no-pkgs = import nur-source { };
  nur.modules = builtins.mapAttrs (_: r: r.modules) nur-no-pkgs.repos;
  nur.overlays = builtins.mapAttrs (_: r: r.overlays) nur-no-pkgs.repos;
in

rec {
  lib = {
    data.lourkeur.keys.ssh.nitrokey = ./id_gpgcard.pub;
    modules = {
      inherit (nur.modules.lourkeur) gnome3-fix-extra-layouts;
      mullvad-vpn = builtins.fetchurl {  # will be in upstream 20.09
        url = "https://raw.githubusercontent.com/xfix/nixpkgs/89f5dc24ed9b6aa15d8314b592184399081844ba/nixos/modules/services/networking/mullvad-vpn.nix";
        sha256 = "0jdhhck1x3r11db23xvl0ii51yp03rnvjbsqn034l48ga6glcics";
      };
    };
    overlays = {
      inherit (nur.overlays.lourkeur) patch-xpra;
    };
  };

  imports = with lib.modules; [
  ];
}
