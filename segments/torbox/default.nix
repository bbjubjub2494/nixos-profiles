# A virtual container than can run X applications and cant access the Internet except thru Tor.

let
  hostAddress = "10.0.1.1";
  localAddress = "10.0.1.2";
in
{
  containers.torbox = {
    autoStart = true;

    privateNetwork = true;
    inherit hostAddress localAddress;

    config = { pkgs, ...}: {
      users.users.user = {
        isNormalUser = true;
        uid = 1001;  # should be the same as my user

        packages = with pkgs; [ git firefox ];
      };

      services.mingetty.autologinUser = "user";

      networking.proxy.default = "socks5h://${hostAddress}:9063";

      services.tor.torsocks = {
        enable = true;
        server = "${hostAddress}:9050";
        fasterServer = "${hostAddress}:9063";
      };
    };

    # need to xhost and stuff
    bindMounts = {
      x11_sockets = rec {
        hostPath = "/tmp/.X11-unix";
        mountPoint = hostPath;
        isReadOnly = true;
      };
      home = {
        hostPath = "/home/louis/torbox";
        mountPoint = "/home/user";
        isReadOnly = false;
      };
    };
  };

  services.tor.client.socksListenAddress = "${hostAddress}:9050";
  services.tor.client.socksListenAddressFaster = "${hostAddress}:9063";

  networking.firewall.interfaces.ve-torbox.allowedTCPPorts = [ 9050 9063 ];

  # Tor needs $hostAddress to be up in order to start properly
  systemd.services.tor = rec {
    after = [ "container@torbox.service" ];
    requisite = after;
  };
}
