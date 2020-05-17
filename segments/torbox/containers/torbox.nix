{ config, ... }:

let
  hostAddress = "10.0.1.1";
  localAddress = "10.0.1.2";
  torsocksAddress = "${hostAddress}:9050";
  torsocksUrl = "socks5h://${torsocksAddress}";
  privoxyUrl = "http://${hostAddress}:8118";
  forwardPorts = [
    8118  # privoxy
    9050  # isolated tor
  ];
in
{
  containers.torbox = {
    privateNetwork = true;
    inherit hostAddress localAddress;

    config = { pkgs, ...}: {
      users.users.user = {
        isNormalUser = true;
        uid = 1001;  # should be the same as my user

        packages = with pkgs; [ git brave ];
      };

      services.mingetty.autologinUser = "user";

      nixpkgs.overlays = [ config.lib.overlays.patch-xpra ];
      # to use:
      # xpra attach tcp://torbox
      # sudo nixos-container run torbox -- su user -lc 'DISPLAY=:0 brave'
      services.xserver.enable = true;
      services.xserver.displayManager.xpra = {
        enable = true;
        auth = "allow";
        bindTcp = "${localAddress}:14500";
      };
      networking.firewall.allowedTCPPorts = [ 14500 ];

      networking.proxy = rec {
        default = torsocksUrl;
        httpProxy = privoxyUrl;
        httpsProxy = privoxyUrl;
      };

      services.tor.torsocks = {
        enable = true;
        server = torsocksAddress;
      };
    };

    # host file-sharing & such
    bindMounts = {
      home = {
        hostPath = "/home/louis/torbox";
        mountPoint = "/home/user";
        isReadOnly = false;
      };
    };
  };

  networking.firewall.interfaces.ve-torbox.allowedTCPPorts = forwardPorts;
}
