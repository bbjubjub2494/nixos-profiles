{
  services.openvpn.servers.proton.config = ''
    config /home/louis/.protonvpn-cli/protonvpn_openvpn_config.conf
    auth-user-pass /home/louis/.protonvpn-cli/protonvpn_openvpn_credentials
  '';
}
