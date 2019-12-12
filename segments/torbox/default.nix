let
  hostAddress = "10.0.1.1";
  localAddress = "10.0.1.2";
in
{
  containers.torbox = {
    privateNetwork = true;
    inherit hostAddress localAddress;

    config = {
      users.users.user = {
        isNormalUser = true;
      };
      networking.proxy.default = "socks5h://${hostAddress}:9063";
    };

    # need to xhost and stuff
    bindMounts.x11_sockets = rec {
      hostPath = "/tmp/.X11-unix";
      mountPoint = hostPath;
      isReadOnly = true;
    };
  };

  services.tor.client.socksListenAddress = "${hostAddress}:9050";
  services.tor.client.socksListenAddressFaster = "${hostAddress}:9063";

  networking.firewall.interfaces.ve-torbox.allowedTCPPorts = [ 9050 9063 ];
}
