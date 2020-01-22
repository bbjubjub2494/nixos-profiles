{ pkgs, ... }:

# Enable the eponymous Desktop Environment.

{
  services.xserver.desktopManager.gnome3.enable = true;
  environment.gnome3.excludePackages = [
    pkgs.gnome3.geary  # doesn't build for some reason
  ];

  environment.systemPackages = with pkgs; [
    gimp
    gnome3.dconf-editor
    gnome3.gnome-tweaks
  ];

  services.xserver.desktopManager.default = "gnome";
}
