{ pkgs, ... }:

# Make some CLI utility programs always available.

{
  environment.systemPackages = with pkgs; [
    bind  # dig
    file
    htop
    libarchive  # for bsdtar et al.
    neovim
    tree
  ];

  environment.variables.EDITOR = "nvim";

  services.atd.enable = true;
}
