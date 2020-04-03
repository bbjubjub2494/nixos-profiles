# A container than can run X applications and cant access the Internet except thru gateway containers that (hopefully) anonymize traffic.

{
  imports = [
    ./containers/torbox.nix
    ./containers/tor-gateway.nix
  ];

  systemd.services.torbox = {
    requires = [
      "container@torbox.service"
      "container@tor-gateway.service"
    ];
  };
}
