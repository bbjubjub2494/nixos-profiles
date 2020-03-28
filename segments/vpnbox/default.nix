# Container connected to a VPN
# TODO: privoxy?
# TODO: wireguard?
# TODO: split VPN and applications into different containers?
# TODO: merge with torbox?

let
  hostAddress = "10.0.2.1";
  localAddress = "10.0.2.2";
  nameserverAddress = "193.138.218.74";  # Mullvad's DNS
  mullvadProxyUrl = "socks5://10.8.0.1";  # mullvad's enclave proxy
in
{
  containers.vpnbox = {
    privateNetwork = true;
    enableTun = true;  # needed for OpenVPN
    inherit hostAddress localAddress;

    config = { pkgs, ...}: {
      users.users.user = {
        isNormalUser = true;
        uid = 1001;  # should be the same as my user

        packages = with pkgs; [ git firefox ];
      };

      services.mingetty.autologinUser = "user";

      networking.proxy = rec {
        default = mullvadProxyUrl;
      };

      environment.etc.openvpn.source = pkgs.callPackage ./config.nix {};
      services.openvpn.servers.mullvad.config = "config /etc/openvpn/mullvad_us_all.conf";
      systemd.services.openvpn-mullvad.serviceConfig.WorkingDirectory = "/etc/openvpn";

      networking.nameservers = [ nameserverAddress ];  # needed for OpenVPN bootstrapping
    };

    # need to xhost and stuff
    bindMounts = {
      x11_sockets = rec {
        hostPath = "/tmp/.X11-unix";
        mountPoint = hostPath;
        isReadOnly = true;
      };
      home = {
        hostPath = "/home/louis/vpnbox";
        mountPoint = "/home/user";
        isReadOnly = false;
      };
    };
  };

  # OpenVPN itself needs outside access.
  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-vpnbox" ];
  };
}
