{ config, pkgs, ... }:

{
  services.xserver.desktopManager.gnome3.enable = true;
  environment.gnome3.excludePackages = [
    pkgs.gnome3.geary  # doesn't build for some reason
  ];

  services.xserver.desktopManager.default = "gnome";
}
