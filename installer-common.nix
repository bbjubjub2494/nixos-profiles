{ config, lib, ... }:

{
  imports = [
      # Dependencies
      ./common

      # System Customization
      segments/cli-utils
      segments/pager
      segments/fish

      # enable SSH by default
      segments/sshd

      # host keys
      segments/trusted-machines

      # Localization
      segments/i18n
      segments/custom-layout
    ];

  services.rogue.enable = true;

  services.openssh.permitRootLogin = lib.mkForce "prohibit-password";

  users.users.root.openssh.authorizedKeys.keyFiles = [
    config.lib.data.lourkeur.keys.ssh.nitrokey
  ];
}
