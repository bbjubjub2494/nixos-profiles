{ pkgs, ... }:

# Make Wireshark available.

{
  programs.wireshark.enable = true;
  programs.wireshark.package = pkgs.wireshark;
}
