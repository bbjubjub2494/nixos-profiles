{ pkgs, ... }:

# Make some CLI utility programs always available.

{
  imports =
    [
      <nixpkgs/nixos/modules/profiles/base.nix>
    ];

  environment.systemPackages = with pkgs; [
    file
    htop
    neovim
  ];

  environment.variables.EDITOR = "nvim";

  services.atd.enable = true;
}
