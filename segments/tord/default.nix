{ config, lib, pkgs, ... }:

{
  services.tor = {
    enable = true;
    client.enable = true;
    controlSocket.enable = true;
  };

  systemd.services.tor.wantedBy = lib.mkForce [];

  environment.systemPackages = with pkgs; [ nyx ];
}
