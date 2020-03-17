{pkgs, ... }:

# Enable the Xorg server.

{
  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.xhost
  ];
}
