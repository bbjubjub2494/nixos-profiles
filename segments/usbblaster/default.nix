{ pkgs, ... }:

{
  services.udev.packages = with pkgs; [
    (callPackage nix/usbblaster-udev-rules.nix {})
  ];

  users.groups.usbblaster = {};
}
