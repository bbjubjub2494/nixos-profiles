{ config, lib, pkgs, ... }:

# A customized NixOS installer image.
# Features:
#   - Fish shell with my preferred prompt.
#   - My text editor and pager are available.
#   - My custom keyboard layout is set by default.
#   - I can log in via SSH using public key authentication.
#   - My native language & timezone.
#   - Gnome3 is selected.
#   - Rogue on tty8.

{
  imports = [
      # reuse a config from NixOS
      <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix>

      # Dependencies
      ./common

      # System Customization
      segments/boot-splash
      segments/cli-utils
      segments/pager
      segments/fish

      # enable SSH by default
      segments/sshd

      # Localization
      segments/i18n
      segments/custom-layout

      # Desktop Environment
      segments/fonts
      segments/x11
      segments/gnome3
    ];

  services.rogue.enable = true;

  services.openssh.permitRootLogin = lib.mkForce "prohibit-password";

  users.users.root.openssh.authorizedKeys.keyFiles = [
    config.lib.data.lourkeur.keys.ssh.nitrokey
  ];
}
