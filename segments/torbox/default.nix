# A virtual container than can run X applications and cant access the Internet except thru Tor.

let
  hostAddress = "10.0.1.1";
  localAddress = "10.0.1.2";
  torsocksUrl = "socks5h://${hostAddress}:9050";
  privoxyUrl = "http://${hostAddress}:8118";
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

      networking.proxy = rec {
        default = torsocksUrl;
        httpProxy = privoxyUrl;
        httpsProxy = privoxyUrl;
      };

      services.tor.torsocks = {
        enable = true;
        server = "${hostAddress}:9050";
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
  services.privoxy.listenAddress = "${hostAddress}:8118";

  networking.firewall.interfaces.ve-torbox.allowedTCPPorts = [ 8118 9050 ];

  # Tor and privoxy needs $hostAddress to be up in order to start properly
  systemd.services =
    let common = rec {
      after = [ "container@torbox.service" ];
      requisite = after;
    };
    in {
      tor = common;
      privoxy = common;
    };
}
