{ pkgs, ... }:

# Enable the eponymous Desktop Environment.

{
  services.xserver.desktopManager.gnome3.enable = true;
  programs.geary.enable = false;  # doesn't build for some reason
  environment.gnome3.excludePackages = with pkgs; [
    gnome3.epiphany  # I don't use
  ];

  environment.systemPackages = with pkgs; [
    gimp
    gnome3.dconf-editor
    gnome3.gnome-tweaks
  ];

  services.xserver.displayManager.defaultSession = "gnome";
}
