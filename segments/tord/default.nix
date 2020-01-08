{ lib, pkgs, ... }:

{
  services.tor = {
    enable = true;
    client.enable = true;
    controlSocket.enable = true;
  };

  environment.systemPackages = with pkgs; [ nyx ];
}
