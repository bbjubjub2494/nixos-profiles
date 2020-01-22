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

  environment.shellAliases = {
    c = "bsdtar --create  -f -";
    t = "bsdtar --list    -f -";
    x = "bsdtar --extract -f -";
  };

  environment.variables.EDITOR = "nvim";

  services.atd.enable = true;
}
