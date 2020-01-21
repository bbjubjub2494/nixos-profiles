{ config, ... }:

# My account.

let
  username = "louis";
  uid = 1001;
in {
  users.users.${username} = {
    inherit uid;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "nitrokey"
      "usbblaster"
      "tor"
      "transmission"
      "audio"
      "wireshark"
    ];
    openssh.authorizedKeys.keyFiles = [
      config.lib.data.lourkeur.keys.ssh.nitrokey
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  services.mingetty.autologinUser = username;

  services.xserver.displayManager.auto.enable = true;
  services.xserver.displayManager.auto.user = username;
}
