{ stdenv, unzip }:

# my mullvad.net OpenVPN configuration. $src isn't available publicly, use your own.

stdenv.mkDerivation {
  name = "mullvad-openvpn";

  src = /nix/store/li5jif154aqa7skjjw5rwmx5lniwk56v-mullvad_openvpn_linux_all_all.zip;
  buildInputs = [ unzip ];

  buildPhase = ''
  chmod +x update-resolv-conf
  '';

  installPhase = ''
  mkdir $out
  cp -r . -T $out
  '';
}
