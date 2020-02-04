{ config, lib, ... }:

{
  imports = [
      # Dependencies
      segments/common

      # Booting process
      segments/rescue-shell

      # System Customization
      segments/cli-utils
      segments/pager
      segments/autojump
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
