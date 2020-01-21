{ pkgs, ... }:

# Support for (some) FPGA cards.

{
  services.udev.packages = with pkgs; [
    (callPackage nix/usbblaster-udev-rules.nix {})
  ];

  users.groups.usbblaster = {};
}
