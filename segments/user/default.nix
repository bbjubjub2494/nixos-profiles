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
      "networkmanager"
      "lxd"
      "docker"
      "vboxusers"
    ];
    openssh.authorizedKeys.keyFiles = [
      config.lib.data.lourkeur.keys.ssh.nitrokey
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  services.mingetty.autologinUser = username;

  services.xserver.displayManager.lightdm.autoLogin = {
    enable = true;
    user = username;
  };
}
