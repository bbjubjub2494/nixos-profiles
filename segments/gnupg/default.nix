{ lib, ... }:

# Configure GPG for my use, namely on a Nitrokey device.

{
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  hardware.nitrokey.enable = true;

  services.gnome3.gnome-keyring.enable = lib.mkForce false;  # tends to conflict
}
