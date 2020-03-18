# Enable and configure the built-in basic iptables firewall.

{
  networking.firewall = {
    enable = true;
    # open ephemeral ports
    allowedTCPPortRanges = [{from = 32768; to = 60999;}];
  };
}
